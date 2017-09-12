class Api::V1::InviteSerializer < ActiveModel::Serializer
  attributes :id, :token, :group_id, :user_id, :valid_for

  def valid_for
    Settings.invite_valid_for
  end
end
