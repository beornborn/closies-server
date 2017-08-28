class User < ApplicationRecord
  has_secure_token :auth_token

  has_many :activities, dependent: :delete_all
end
