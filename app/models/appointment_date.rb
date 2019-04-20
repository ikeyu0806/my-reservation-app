class AppointmentDate < ApplicationRecord
  belongs_to :event, foreign_key: :event_id

  def self.candidate_date(event_id)
    appointment_date = AppointmentDate.find_by(event_id: event_id)
    from_date = appointment_date.from_date.to_date.strftime('%Y-%m-%d')
    to_date = appointment_date.to_date.to_date.strftime('%Y-%m-%d')
    wday = appointment_date.wday
    time = appointment_date.time
    candidate_date = []
    (DateTime.parse(from_date)..DateTime.parse(to_date)).each do |date|
      candidate_date << date
    end
    candidate_date
  end
end
