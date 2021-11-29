class Family < ApplicationRecord
  belongs_to :user

  validates :race, :price, :description, :title, :location, presence: true
end
