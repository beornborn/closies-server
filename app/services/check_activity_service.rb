class CheckActivityService
  def initialize(activity, user)
    @activity = activity
    @user = user
  end

  def call
    unless @activity.checked.include? @user.id
      @activity.update(checked: @activity.checked + [@user.id])
    end

    @activity.comments.each do |comment|
      unless comment.checked.include? @user.id
        comment.update(checked: comment.checked + [@user.id])
      end
    end
  end
end
