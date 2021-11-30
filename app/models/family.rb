class Family < ApplicationRecord
  belongs_to :user

  validates :race, :price, :description, :title, :location, presence: true

  ETHNICITY = ["African", "Indian", "Southeast Asian", "Asian", "Arabian", "Latino", "European", "American", "Russian", "Albino", "Australian"]
end
