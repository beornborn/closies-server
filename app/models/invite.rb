class Invite < ApplicationRecord
  include Tokenable

  belongs_to :group
  belongs_to :user, required: false

  validates :token, uniqueness: true
end
