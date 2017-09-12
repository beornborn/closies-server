class Invite < ApplicationRecord
  include Tokenable

  belongs_to :group
  belongs_to :user

  validates :token, uniqueness: true
end
