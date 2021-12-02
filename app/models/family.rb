class Family < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_many :reviews, through: :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :ethnicity, :price, :description, :title, :location, presence: true

  ETHNICITY = ["African", "Indian", "Southeast Asian", "Asian", "Arabian", "Latino", "European", "American", "Russian", "Albino", "Australian"]

  def average_rating
    ratings = reviews.pluck(:rating)
    return 0 if ratings.empty?
    ratings.sum / ratings.length
  end
end
