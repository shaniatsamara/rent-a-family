class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :family
  has_many :reviews

  PAYMENT_METHODS = ["Cash", "Credit", "Debit", "Transfer"]
  STATUSES = ["Reject", "Accept", "Pending"]

  validates :start_date, :end_date, :payment_method, presence: true
  validate :end_date_after_start_date, :different_owner

  private

  def end_date_after_start_date
    if end_date < start_date
      errors.add(:end_date, "has to be after the starting date")
    end
  end

  def different_owner
    if family.user == user
      errors.add(:user, "You cannot book your own family")
    end
  end
end
