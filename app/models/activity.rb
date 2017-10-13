class Activity < ApplicationRecord
  mount_uploader :image, ActivityImageUploader

  COLORS = ['#0000ff', '#ff7f00', '#00ff00', '#9400d3','#ffff00'].freeze

  belongs_to :user_in_group
  has_many :comments
  has_one :user, through: :user_in_group
  has_one :group, through: :user_in_group
end
