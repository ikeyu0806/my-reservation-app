require 'rails_helper'

RSpec.describe AppointmentDatesController, type: :controller do
  let!(:event) { create(:event) }
  let(:appointment_date) { create(:appointment_date, event: event) }
  let(:valid_attributes) do
    {
      from_date: '2019-04-01 00:00:00',
      to_date: '2019-05-01 00:00:00',
      wday: 'friday',
      time: '15:00:00',
      event_id: 10
    }
  end

  let(:invalid_attributes) do
    {
      from_date: '',
      to_date: '2019-05-01 00:00:00',
      wday: 'friday',
      time: '15:00:00',
      event_id: 10
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
        post :create, params: { appointment_date: valid_attributes }
        expect(response.status).to eq 302
      end

      it '正常に予約枠設定が登録できること' do
        expect do
          post :create, params: { appointment_date: valid_attributes }
        end.to change(AppointmentDate, :count).by(1)
      end

      it '予約ページにリダイレクトすること' do
        post :create, params: { appointment_date: valid_attributes }
        expect(response).to redirect_to controller: :appointment_dates, action: :new
      end
    end

    context '不正なパラメータの場合' do
      it '正常に応答すること' do
        post :create, params: { appointment_date: invalid_attributes }
        expect(response).to be_successful
      end

      it '予約枠設定が登録できないこと' do
        expect do
          post :create, params: { appointment_date: invalid_attributes }
        end.to change(AppointmentDate, :count).by(0)
      end
    end
  end
end
