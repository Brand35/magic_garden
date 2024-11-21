class Item < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
