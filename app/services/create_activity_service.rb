class CreateActivityService
  def initialize(params, user)
    @params = params
    @user = user
  end

  def call
    @params[:group_ids].each do |group_id|
      user_in_group = UserInGroup.find_by(group_id: group_id, user_id: @user.id)
      params = @params.except(:group_ids).merge(user_in_group_id: user_in_group.id)
      Activity.create(params)
    end
  end
end
