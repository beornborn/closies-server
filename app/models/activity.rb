class Activity < ApplicationRecord
  COLORS = ['#0000ff', '#ff7f00', '#00ff00', '#9400d3','#ffff00'].freeze

  belongs_to :user

  def self.restore_seeds
    Activity.delete_all
    u = User.first
    30.times do |i|
      Activity.create({
        latitude: 50.4414 + rand() * (0.18),
        longitude: 30.493 + rand() * (30.6920 - 30.5030),
        user_id: u.id,
        description: Faker::Matz.quote,
        color: u.color,
        created_at: Time.now - (1.day * rand()).to_i
      })
    end
  end
end
