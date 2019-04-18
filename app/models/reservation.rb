class Reservation < ApplicationRecord
  validates :user_name, presence: true
  validates :mail, presence: true
  validates :phone_number, presence: true
  validates :date, presence: true
end
