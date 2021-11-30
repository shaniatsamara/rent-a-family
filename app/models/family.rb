class Family < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :race, :price, :description, :title, :location, presence: true

  ETHNICITY = ["African", "Indian", "Southeast Asian", "Asian", "Arabian", "Latino", "European", "American", "Russian", "Albino", "Australian"]
end
