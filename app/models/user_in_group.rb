class UserInGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :activities, dependent: :destroy

  before_create :set_color

  def set_color
    self.color = Activity::COLORS[group.users.count % Activity::COLORS.size]
  end
end
