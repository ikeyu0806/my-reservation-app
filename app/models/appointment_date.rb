class AppointmentDate < ApplicationRecord
  belongs_to :reservation
  has_one :excluded_date
end
