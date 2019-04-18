require 'rails_helper'

RSpec.describe ReservationController, type: :controller do
  let(:valid_attributes) do
    {
      user_name: 'content',
      mail: 'mail@examp;le.com',
      phone_number: '09012345678',
      date: '2019/4/01'
    }
  end

  let(:invalid_attributes) do
    {
      user_name: 'content',
      mail: 'mail@examp;le.com',
      phone_number: '09012345678',
      date: '2019/4/01'
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
      it '正常に予約できること' do
        expect do
          post :create, params: { post: valid_attributes }
        end.to change(Reservation, :count).by(1)
      end

      it '予約ページにリダイレクトすること' do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(Reservation.last)
      end
    end

    context '不正なパラメータの場合' do
      it '正常に応答すること' do
        post :create, params: { post: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end