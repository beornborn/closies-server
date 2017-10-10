class CheckActivityService
  def initialize(activity, user)
    @activity = activity
    @user = user
  end

  def call
    new_checked = (@activity.checked + [@user.id]).uniq
    @activity.update(checked: new_checked)
  end
end
