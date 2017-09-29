class Api::V1::GroupsController < Api::V1::BaseController
  def create
    CreateGroupService.new(group_params, current_user).call
    groups = current_user.groups.includes(user_in_groups: :user).all
    render json: groups, include: ['user_in_groups.user']
  end

  def index
    groups = current_user.groups.includes(user_in_groups: :user).all
    render json: groups, include: ['user_in_groups.user']
  end

  private

  def group_params
    params.require(:group).permit(:name, :size_type)
  end
end
