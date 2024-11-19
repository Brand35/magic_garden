class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_item, only: %i[new create]

  def index
    @bookings = Booking.all
  end

  def show; end

  def new
    @booking = @item.bookings.build
  end

  def create
    @booking = @item.bookings.build(booking_params)
    @booking.user = current_user # Assurez-vous que l'utilisateur est connecté

    if @booking.save
      redirect_to @booking, notice: 'Réservation créée avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Réservation mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Réservation supprimée avec succès.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
