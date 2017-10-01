class Group < ApplicationRecord
  has_many :user_in_groups, dependent: :destroy
  has_many :users, through: :user_in_groups
  has_many :activities, through: :user_in_groups

  enum size_type: [:family, :closies, :special]
end
