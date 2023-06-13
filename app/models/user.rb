class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Referneces
  has_many :chairs, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # cloudinary photos
  has_one_attached :photo
end
