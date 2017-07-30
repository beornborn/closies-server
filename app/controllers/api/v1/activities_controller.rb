module Api::V1
  class ActivitiesController < BaseController
    def index
      @activities = Activity.all
      render json: {activities: @activities}
    end

    def create
      Activity.create(activity_params)
      render json: {}
    end

    private

    def activity_params
      params.require(:activity).permit(:longitude, :latitude)
    end
  end
end
