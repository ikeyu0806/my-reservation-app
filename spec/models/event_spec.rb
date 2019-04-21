require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should have_many(:reservations) }
  it { should have_one(:appointment_date) }
end
