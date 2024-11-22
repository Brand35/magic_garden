class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy update_status]
  before_action :set_item, only: %i[new create]
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings.includes(:item)
  end

  def show; end

  def new
    @booking = @item.bookings.build
  end

  def create
    @booking = @item.bookings.build(booking_params)
    @booking.renter = current_user

    if @booking.save
      redirect_to @booking, notice: 'Réservation créée avec succès ! En attente de validation par le propriétaire.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Modification d'une réservation
  def edit; end

  # Mise à jour d'une réservation
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Réservation mise à jour avec succès.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if authorized_user?(@booking)
      @booking.destroy
      redirect_to bookings_path, notice: 'Réservation supprimée avec succès.'
    else
      redirect_to bookings_path, alert: 'Vous n\'êtes pas autorisé à supprimer cette réservation.'
    end
  end

  def user_bookings
    @user = User.find_by(id: params[:id])
    if @user
      @bookings = Booking.where(renter: @user)
    else
      redirect_to root_path, alert: 'Utilisateur non trouvé.'
    end
  end

  def update_status
    if authorized_user?(@booking)
      if @booking.update(status: params[:status])
        flash[:notice] = "Réservation mise à jour avec succès."
      else
        flash[:alert] = "Erreur lors de la mise à jour de la réservation."
      end
      redirect_back(fallback_location: dashboard_path)
    else
      redirect_to dashboard_path, alert: "Vous n'êtes pas autorisé à mettre à jour cette réservation."
    end
  end

  def my_bookings
    @bookings = current_user.bookings.includes(:item)
  end

  private

  # Définir la réservation en fonction de l'ID
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Définir l'item en fonction de l'ID
  def set_item
    @item = Item.find(params[:item_id])
  end

  # Autoriser uniquement les paramètres nécessaires
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  # Vérifier si l'utilisateur actuel est autorisé à accéder à la réservation
  def authorized_user?(booking)
    current_user == booking.renter || current_user == booking.item.owner
  end
end
