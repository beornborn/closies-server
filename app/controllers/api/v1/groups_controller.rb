class Api::V1::GroupsController < Api::V1::BaseController
  before_action :set_group, only: :destroy

  def create
    CreateGroupService.new(create_group_params, current_user).call
    groups = current_user.groups.includes(user_in_groups: :user).all
    render json: groups, include: ['user_in_groups.user']
  end

  def destroy
    DestroyGroupService.new(@group, current_user).call
    render json: {}
  end

  def index
    groups = current_user.groups.includes(user_in_groups: :user).all
    render json: groups, include: ['user_in_groups.user']
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def create_group_params
    params.require(:group).permit(:name, :size_type)
  end
end
