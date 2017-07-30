module Api::V1
  class AuthController < BaseController
    skip_before_action :authenticate

    def login
      user = LoginService.new(params[:fb_token]).call
      render json: {auth_token: user.auth_token}
    end
  end
end
