class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :created_at, :updated_at, :description, :image_url, :user_in_group_id, :checked

  belongs_to :user_in_group, serializer: Api::V1::UserInGroupSerializer
  has_many :comments, array_serializer: Api::V1::CommentSerializer

  def image_url
    object.image.try(:url)
  end
end
