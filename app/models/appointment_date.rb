class AppointmentDate < ApplicationRecord
  belongs_to :event, foreign_key: :event_id
end
