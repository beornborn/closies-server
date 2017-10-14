class Api::V1::CommentsController < Api::V1::BaseController
  def create
    CreateActivityCommentService.new(create_comment_params, current_user).call
    render json: {}
  end

  private

  def create_comment_params
    params.require(:comment).permit(:activity_id, :body)
  end
end
