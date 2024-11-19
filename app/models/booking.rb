class Booking < ApplicationRecord
  # La réservation appartient à un locataire (user)
  belongs_to :renter, class_name: 'User'

  # La réservation appartient à un item
  belongs_to :item

  # L'owner de l'item est accessible via l'association item
  has_one :owner, through: :item
end
