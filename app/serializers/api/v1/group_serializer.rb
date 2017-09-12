class Api::V1::GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :size_type, :size_limit

  def size_limit
    Settings.size_limits[object.size_type]
  end
end
