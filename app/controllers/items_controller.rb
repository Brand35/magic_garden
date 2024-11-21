class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, notice: 'Item créé avec succès.'
    else
      render :new
    end
  end

  def edit
    # L'action `edit` affiche simplement la page d'édition.
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item supprimé avec succès.'
  end

  # action owner
  def owner_items
    @items = current_user.items

    # @item = current_user.items(item_params)
    if current_user
      # redirect_to owner_items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo)
  end
end
