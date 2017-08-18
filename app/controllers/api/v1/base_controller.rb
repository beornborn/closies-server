class Api::V1::BaseController < ApplicationController
  before_action :authenticate
  helper_method :current_user

  def authenticate
    render json: {error: 'not_authenticated'} unless current_user
  end

  def current_user
    @current_user ||= User.find_by auth_token: request.headers['X-API-AUTHTOKEN']
  end

  def default_serializer_options
    { root: false }
  end
end
