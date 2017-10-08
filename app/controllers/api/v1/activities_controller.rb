class Api::V1::ActivitiesController < Api::V1::BaseController
  def index
    @activities = Activity.includes(user_in_group: [:user]).where('created_at > ?', Time.now - Settings.actual_period).all
    render json: @activities, include: ['user_in_group.user']
  end

  def create
    CreateActivityService.new(create_activity_params, current_user).call
    render json: {}
  end

  private

  def create_activity_params
    params.permit(:longitude, :latitude, :description, :image, group_ids: [])
  end
end
