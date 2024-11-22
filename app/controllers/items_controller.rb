class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    if params[:query].present?
      @items = Item.search_by_name_and_description(params[:query])
    else
      @items = Item.all
    end
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        marker_html: render_to_string(partial: "marker"),
        info_window_html: render_to_string(partial: "info_window", locals: { item: item })
      }
    end
  end

  # Affiche un item spécifique
  def show
    @item = Item.find(params[:id])
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.owner = current_user
    if @item.save
      redirect_to dashboard_path, notice: 'Objet ajouté avec succès !'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item mis à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: 'Item supprimé avec succès.' }
        format.turbo_stream
      end
    else
      flash[:alert] = 'Une erreur est survenue lors de la suppression de l\'item.'
      redirect_to dashboard_path
    end
  end

  def dashboard
    @items = current_user.items
    @bookings = Booking.joins(:item)
                       .where(items: { owner_id: current_user.id })
                       .where.not(status: 'rejected') # Exclut les refusées
                       .includes(:item)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to items_path, alert: "Item introuvable."
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo)
  end
end
