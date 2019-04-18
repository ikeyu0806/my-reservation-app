require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should validate_presence_of(:user_name) }
  it { should validate_presence_of(:mail) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:date) }
end
