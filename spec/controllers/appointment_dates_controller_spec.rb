require 'rails_helper'

RSpec.describe AppointmentDatesController, type: :controller do
  event = Event.create!(id: 1, name: '飲み会')

  let(:valid_attributes) do
    {
      from_date: '2019-04-01 00:00:00',
      to_date: '2019-05-01 00:00:00',
      wday: 'friday',
      time: '15:00:00',
      event_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      from_date: '2019-04-01 00:00:00',
      to_date: '2019-05-01 00:00:00',
      wday: 'friday',
      time: '15:00:00',
      event_id: '100'
    }
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context '正常なパラメータの場合' do
      it 'リクエストが成功すること' do
        post :create, params: { appointment_dates: valid_attributes }
        expect(response.status).to eq 302
      end

      it '正常に予約できること' do
        expect do
          post :create, params: { appointment_dates: valid_attributes }
        end.to change(AppointmentDates, :count).by(1)
      end

      it '予約ページにリダイレクトすること' do
        post :create, params: { appointment_dates: valid_attributes }
        expect(response).to redirect_to controller: :appointment_dates, action: :new
      end
    end

    context '不正なパラメータの場合' do
      it 'リクエストが成功すること' do
        post :create, params: { appointment_dates: invalid_attributes }
        expect(response.status).to eq 200
      end

      it '予約できないこと' do
        expect do
          post :create, params: { appointment_dates: invalid_attributes }
        end.to change(AppointmentDates, :count).by(0)
      end
    end
  end
end
