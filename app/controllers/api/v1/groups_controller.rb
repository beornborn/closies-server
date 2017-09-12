class Api::V1::GroupsController < Api::V1::BaseController
  def create
    CreateGroupService.new(group_params, current_user).call
    render json: {}
  end

  private

  def group_params
    params.permit(:name, :size_type)
  end
end
