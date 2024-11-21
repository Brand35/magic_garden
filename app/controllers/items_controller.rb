class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @items = Item.search_by_name_and_description(params[:query])
    else
      @items = Item.all
    end
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.owner = current_user
    if @item.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
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
  def dashboard
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
