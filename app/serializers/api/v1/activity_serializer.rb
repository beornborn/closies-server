class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :created_at, :updated_at, :description, :image_url, :user_in_group_id

  belongs_to :user_in_group, serializer: Api::V1::UserInGroupSerializer

  def image_url
    object.image.try(:url)
  end
end
