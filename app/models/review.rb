class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy

  validates :comment, :rating, presence: true
  validate :after_end_date

  def after_end_date
    if booking.end_date >= Date.today
      errors.add(:rating, "cannot add review yet")
    end
  end
end
