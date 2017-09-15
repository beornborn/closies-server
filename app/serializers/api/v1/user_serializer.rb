class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :gender, :picture, :phone_number, :messengers
end
