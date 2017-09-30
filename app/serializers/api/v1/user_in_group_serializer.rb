class Api::V1::UserInGroupSerializer < ActiveModel::Serializer
  attributes :id, :color, :user_id, :group_id, :owner

  belongs_to :user, serializer: Api::V1::UserSerializer
  belongs_to :group, serializer: Api::V1::GroupSerializer
end
