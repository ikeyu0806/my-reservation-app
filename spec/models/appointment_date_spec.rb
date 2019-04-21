require 'rails_helper'

RSpec.describe AppointmentDate, type: :model do
  it { should validate_presence_of(:from_date) }
  it { should validate_presence_of(:to_date) }
  it { should belong_to(:event) }

  describe 'candidate_dateメソッドの確認' do

    subject { AppointmentDate.candidate_date(1) }
    let!(:appointment_date) { create(:appointment_date) }
    it '想定どおり候補日が返ること' do
      expect(subject).to include 'Fri, 05 Apr 2019 15:00:00.000000000 +0000'
    end

    it '想定どおり候補日が返ること' do
      expect(subject).not_to include 'Fri, 12 Apr 2019 15:00:00.000000000 +0000'
    end
  end
end
