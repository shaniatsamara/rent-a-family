class User < ApplicationRecord
  has_many :families, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_one_attached :avatar

  validates :email, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
