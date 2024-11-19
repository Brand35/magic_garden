class ModifyBookingsTable < ActiveRecord::Migration[7.2]
  def change
    # Supprimer les anciennes colonnes
    remove_reference :bookings, :user, foreign_key: true
    remove_reference :bookings, :item, foreign_key: true

    # Ajouter les nouvelles colonnes avec des références spécifiques
    add_reference :bookings, :renter, null: false, foreign_key: { to_table: :users }
    add_reference :bookings, :item, null: false, foreign_key: true
  end
end
