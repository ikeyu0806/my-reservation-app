class Reservation < ApplicationRecord
  validates :user_name, presence: true
  validates :mail, presence: true
  validates :phone_number, presence: true
  validates :date, presence: true

  belongs_to :event, foreign_key: :event_id
  has_one :appointment_date, through: :event
end
