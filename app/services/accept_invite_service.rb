class AcceptInviteService
  def initialize(params, current_user)
    @token = params[:token]
    @user = current_user
  end

  def call
    invite = Invite.find_by(token: token)

    if !invite
      return {error: 'Invalid invitation token'}
    elsif Time.now.to_i - invite.created_at.to_i > Settings.invite_valid_for
      return {error: 'Invitation token is expired, ask your closie about new one'}
    else
      Invite.update(user: @user)
      UserInGroup.create(user_id: @user.id, group_id: invite.group_id)
      invite
    end
  end
end
