class CreateActivityCommentService
  def initialize(params, user)
    @params = params
    @user = user
  end

  def call
    all_params = @params.merge({
      user: @user,
      checked: [@user.id]
    })
    Comment.create(all_params)
  end
end
