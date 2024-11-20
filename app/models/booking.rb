class Booking < ApplicationRecord
  # Associations
  belongs_to :renter, class_name: 'User'
  belongs_to :item
  has_one :owner, through: :item

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  # Validation personnalisée pour vérifier que la date de fin est après la date de début
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "doit être après la date de début")
    end
  end
end
