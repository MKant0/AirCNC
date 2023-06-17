class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chair

  validates :date_start, :date_end, presence: true
end
