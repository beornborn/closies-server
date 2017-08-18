class Api::V1::AuthController < Api::V1::BaseController
  skip_before_action :authenticate, only: [:login]

  def login
    user = LoginService.new(params[:fb_token]).call
    render json: {auth_token: user.auth_token}
  end

  def logout
    LogoutService.new(current_user).call
    render json: {}
  end
end
