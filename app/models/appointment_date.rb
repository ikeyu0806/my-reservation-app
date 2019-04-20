class AppointmentDate < ApplicationRecord
  belongs_to :reservation, foreign_key: :reservation_id
end
