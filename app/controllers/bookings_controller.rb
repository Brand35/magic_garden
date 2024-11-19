class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]
  before_action :set_item, only: %i[new create]
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def show; end

  def new
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.build
  end


  def create
    @item = Item.find(params[:item_id])
    @booking = @item.bookings.build(booking_params)
    @booking.renter = current_user

    if @booking.save
      redirect_to @booking, notice: 'Réservation créée avec succès. En attente de validation par le propriétaire.'
    else
      logger.debug @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'accepted')
    redirect_to owner_bookings_path, notice: 'Réservation acceptée.'
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: 'rejected')
    redirect_to owner_bookings_path, notice: 'Réservation rejetée.'
  end

  def edit
    @booking = Booking.find(params[:id])
    @item = @booking.item
  end

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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
