class DestroyGroupService
  def initialize(group, user)
    @group = group
    @user = user
  end

  def call
    owner = @group.user_in_groups.owner.first
    if owner.user_id == @user.id
      @group.destroy
    else
      @group.user_in_groups.where(user: @user).first.destroy
    end
  end
end
