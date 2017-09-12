class Api::V1::InvitesController < Api::V1::BaseController
  def create
    invite = CreateInviteService.new(invite_create_params).call
    render json: invite
  end

  def accept
    response = AcceptInviteService.new(invite_accept_params, current_user).call
    render json: response
  end

  private

  def invite_create_params
    params.permit(:group_id)
  end

  def invite_accept_params
    params.permit(:token)
  end
end
