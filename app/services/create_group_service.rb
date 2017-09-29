class CreateGroupService
  def initialize(params, user)
    @params = params
    @user = user
  end

  def call
    group = Group.create(@params)
    UserInGroup.create(user: @user, group: group, owner: true)
  end
end
