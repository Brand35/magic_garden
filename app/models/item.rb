class Item < ApplicationRecord
  include PgSearch::Model

  belongs_to :owner, class_name: "User"
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  pg_search_scope :search_by_name_and_description,
                  against: {
                    name: 'A',
                    description: 'B'
                  },
                  using: {
                    tsearch: { prefix: true } # Recherche partielle (ex : "arro" matchera "arrosoir")
                  }
end
