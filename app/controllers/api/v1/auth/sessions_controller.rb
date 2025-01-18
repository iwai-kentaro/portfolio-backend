class Api::V1::Auth::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      render json: { is_login: true, data: current_api_v1_user.slice(:id, :email, :name) }, status: :ok
    else
      render json: { is_login: false, message: "ユーザーが存在しません" }, status: :unauthorized
    end
  end
end
