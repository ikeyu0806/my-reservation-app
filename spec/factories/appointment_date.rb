FactoryBot.define do
  factory :appointment_date do
    from_date { '2019-04-01 00:00:00' }
    to_date { '2019-05-01 00:00:00' }
    excluded_date { '2019-04-12 00:00:00' }
    wday { 'friday' }
    time { '15:00:00' }
    event_id { 1 }
  end
end