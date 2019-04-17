class Event < ApplicationRecord
  has_many :reservations, foreign_key: 'event_id'
end
