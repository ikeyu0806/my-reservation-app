class Event < ApplicationRecord
  has_many :reservations
  has_one :appointment_date
end
