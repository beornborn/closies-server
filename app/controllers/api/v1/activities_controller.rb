class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = Activity.includes(user_in_group: [:user, :group]).where('created_at > ?', Time.now - Settings.actual_period).all
    render json: @activities, include: ['user_in_group.group', 'user_in_group.user']
  end

  def create
    CreateActivityService.new(activity_params).call
    render json: {}
  end

  private

  def activity_params
    params.permit(:longitude, :latitude, :user_id, :description, :image)
  end
end
