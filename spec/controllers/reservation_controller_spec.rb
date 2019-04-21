require 'rails_helper'

RSpec.describe ReservationController, type: :controller do
  # let!(:event) { create(:event) }
  let!(:appointment_date) { create(:appointment_date) }

  let(:valid_attributes) do
    {
      user_name: 'ikegaya',
      mail: 'test@example.com',
      phone_number: '09012345678',
      date: '2019-05-01 18:00:00',
      event_id: 1
    }
  end

  let(:invalid_attributes) do
    {
      user_name: '',
      mail: 'test@example.com',
      phone_number: '09012345678',
      date: '123',
      event_id: 1
    }
  end

  describe 'GET #new' do
    it '正常に応答すること' do
      get :new, params: { reservation: valid_attributes, event_id: 1 }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context '正常なパラメータの場合' do
      it 'リクエストが成功すること' do
        post :create, params: { reservation: valid_attributes }
        expect(response.status).to eq 302
      end

      it '正常に予約できること' do
        expect do
          post :create, params: { reservation: valid_attributes }
        end.to change(Reservation, :count).by(1)
      end

      it 'イベントにリダイレクトすること' do
        post :create, params: { reservation: valid_attributes }
        expect(response).to redirect_to controller: :events, action: :index
      end
    end

    context '不正なパラメータの場合' do
      it '正常に応答すること' do
        post :create, params: { reservation: invalid_attributes }
        expect(response).to be_successful
      end

      it '予約できないこと' do
        expect do
          post :create, params: { reservation: invalid_attributes }
        end.to change(Reservation, :count).by(0)
      end
    end
  end
end