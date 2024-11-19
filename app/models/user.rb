class User < ApplicationRecord
  has_many :bookings, foreign_key: :renter_id
  has_many :items, foreign_key: :owner_id
  has_many :bookings_as_owner, through: :items, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
