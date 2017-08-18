class LogoutService
  def initialize(user)
    @user = user
  end

  def call
    @user.update(auth_token: nil)
  end
end
