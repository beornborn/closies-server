class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :full_name, :gender, :picture,

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
