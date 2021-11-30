class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :family

  PAYMENT_METHODS = ["Cash", "Credit", "Debit", "Transfer"]
  STATUSES = ["Reject", "Accept", "Pending"]
end
