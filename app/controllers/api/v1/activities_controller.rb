class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = Activity.includes(:user).where('created_at > ?', Time.now - 10.day).all
    render json: @activities
  end

  def create
    Activity.create(activity_params.merge({color: current_user.color}))
    render json: {}
  end

  private

  def activity_params
    params.require(:activity).permit(:longitude, :latitude, :user_id, :description)
  end
end
