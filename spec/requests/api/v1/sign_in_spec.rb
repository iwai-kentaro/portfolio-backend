require 'rails_helper'

RSpec.describe 'API::V1::Auth', type: :request do
  describe 'POST /api/v1/auth/sign_in' do
    # テスト実行前にユーザーを作成
    before do
      create(:user, email: 'user@example.com', password: 'password')
    end

    context 'when the credentials are valid' do
      it 'returns a 200 response' do
        post '/api/v1/auth/sign_in', params: { email: 'user@example.com', password: 'password' }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the credentials are invalid' do
      it 'returns a 401 response' do
        post '/api/v1/auth/sign_in', params: { email: 'wrong@example.com', password: 'wrongpassword' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
