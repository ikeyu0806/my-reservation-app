class ExcludedDate < ApplicationRecord
  belongs_to :appointment_date, foreign_key: :appointment_date_id
end
