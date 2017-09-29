class Api::V1::ConfigController < Api::V1::BaseController
  def show
    render json: Settings.as_json
  end
end
