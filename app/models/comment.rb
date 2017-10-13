class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  default_scope -> { order(created_at: :desc) }
end
