class Api::V1::DevController < Api::V1::BaseController
  skip_before_action :authenticate, only: :check

  def check
    render json: {}
  end
end
