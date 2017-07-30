class Api::V1::BaseController < ApplicationController
  before_action :authenticate

  def authenticate
    @current_user = User.find_by auth_token: request.headers['X-API-AUTHTOKEN']
    render json: {error: 'not_authenticated'}, status: 400 unless @current_user
  end

  def default_serializer_options
    { root: false }
  end
end
