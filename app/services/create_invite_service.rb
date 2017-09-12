class CreateInviteService
  def initialize(params)
    @params = params
  end

  def call
    Invite.create(@params)
  end
end
