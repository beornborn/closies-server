class UpdateUserService
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    @user.update(@params)
  end
end
