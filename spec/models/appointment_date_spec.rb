require 'rails_helper'

RSpec.describe AppointmentDate, type: :model do
  it { should validate_presence_of(:from_date) }
  it { should validate_presence_of(:to_date) }
  it { should belong_to(:event) }
end
