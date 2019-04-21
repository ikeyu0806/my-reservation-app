class AppointmentDate < ApplicationRecord
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :time, presence: true
  validates :wday, presence: true
  validates :event_id, presence: true

  belongs_to :event, foreign_key: :event_id

  def self.candidate_date(event_id)
    appointment_date = AppointmentDate.find_by(event_id: event_id)
    from_date = appointment_date.from_date.to_date.strftime('%Y-%m-%d')
    to_date = appointment_date.to_date.to_date.strftime('%Y-%m-%d')
    excluded_date = appointment_date.excluded_date.to_s
    wday = appointment_date.wday
    time = appointment_date.time
    candidate_date = []
    (DateTime.parse(from_date)..DateTime.parse(to_date)).each do |date|
      date_string = date.strftime('%Y-%m-%d').to_s
      if (date.send(wday + "?")) && (date_string != excluded_date)
        candidate_date << date + Rational(time.strftime('%H').to_i, 24)
      end
    end
    candidate_date
  end
end
