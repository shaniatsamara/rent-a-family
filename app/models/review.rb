class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy

  validates :comment, :rating, presence: true
end
