require 'rails_helper'

RSpec.describe ReservationController, type: :controller do
  let(:valid_attributes) do
    {
      user_name: 'ikegaya',
      mail: 'test@example.com',
      phone_number: '09012345678',
      date: '2019-05-01 18:00:00'
    }
  end

  let(:invalid_attributes) do
    {
      user_name: 'ikegaya',
      mail: '',
      phone_number: '',
      date: ''
    }
  end

  describe 'GET #new' do
    it '正常に応答すること' do
      get :new, params: {}
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

      it '予約ページにリダイレクトすること' do
        post :create, params: { reservation: valid_attributes }
        expect(response).to redirect_to controller: :reservation, action: :new
      end
    end

    context '不正なパラメータの場合' do
      it 'リクエストが成功すること' do
        post :create, params: { reservation: invalid_attributes }
        expect(response.status).to eq 200
      end

      it '予約できないこと' do
        expect do
          post :create, params: { reservation: invalid_attributes }
        end.to change(Reservation, :count).by(0)
      end
    end
  end
end