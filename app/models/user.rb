class User < ApplicationRecord
  has_secure_token :auth_token

  has_many :user_in_groups
  has_many :activities, through: :user_in_groups
  has_many :groups, through: :user_in_groups
end
