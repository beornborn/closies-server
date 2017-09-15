class Api::V1::UsersController < Api::V1::BaseController
  def current
    render json: current_user
  end

  def update
    UpdateUserService.new(current_user, update_params).call
    render json: {}
  end

  private

  def update_params
    params.require(:user).permit(:full_name, :phone_number, messengers: [])
  end
end
