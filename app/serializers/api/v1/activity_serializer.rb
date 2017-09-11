class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :created_at, :updated_at, :user_id, :user, :description, :color, :image_url

  belongs_to :user, serializer: Api::V1::UserSerializer

  def image_url
    object.image.try(:url)
  end
end
