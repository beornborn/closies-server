class Api::V1::GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :size_type, :size_limit

  has_many :user_in_groups, serializer: Api::V1::UserInGroupSerializer

  def size_limit
    Settings.size_limits[object.size_type]
  end
end
