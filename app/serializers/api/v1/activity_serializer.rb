class Api::V1::ActivitySerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :created_at, :updated_at, :user_id, :user, :description

  belongs_to :user, serializer: Api::V1::UserSerializer
end
