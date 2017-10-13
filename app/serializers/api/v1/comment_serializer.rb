class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :checked, :activity_id, :created_at

  belongs_to :user, serializer: Api::V1::UserSerializer
  belongs_to :activity, serializer: Api::V1::ActivitySerializer
end
