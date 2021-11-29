class Family < ApplicationRecord
  belongs_to :user

  validates :race, :price, :description, :location, presence: true
end
