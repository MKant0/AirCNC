class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chair

  validates :date_start, :date_end, presence: true
  validate :date_end_after_date_start

  def date_end_after_date_start
    if date_end < date_start
      errors.add(:date_end, "can't be before date start")
    end
  end
end
