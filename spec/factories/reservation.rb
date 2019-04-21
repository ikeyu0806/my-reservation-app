FactoryBot.define do
  factory :reservation do
    user_name { 'user' }
    mail { 'mail@example.com' }
    phone_number { '09012345678' }
    date { '2019-05-01 00:00:00' }
    event_id { 10 }
  end
end