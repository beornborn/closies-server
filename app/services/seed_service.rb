class SeedService
  def initialize
    @users = []
    @groups = []
  end

  def seed
    create_users
    create_groups
    create_user_in_groups
    create_activities
  end

  def delete
    Activity.delete_all
    User.delete_all
    Group.delete_all
    UserInGroup.delete_all
  end

  def reseed
    delete
    seed
  end

  private

  def create_users
    User.create({
      email: 'beornborn@gmail.com',
      full_name: 'Oleg Gorbunov',
      gender: 'male',
      picture: 'https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/19224813_1313697128679118_120511216321167899_n.jpg?oh=77f9955176fd849e2a774c74648679ea&oe=5A222FCC',
      facebook_id: '1352027368179427',
      facebook_link: 'https://www.facebook.com/app_scoped_user_id/1352027368179427/',
    })

    28.times do |i|
      User.create({
        email: Faker::Internet.email,
        full_name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
        picture: Faker::Avatar.image(i + 5, '50x50')
      })
    end

    @users = User.order('id asc')

    ap '------------- users created'
  end

  def create_groups
    @groups = [
      Group.create(name: 'Family', size_type: :family),
      Group.create(name: 'Friends', size_type: :closies),
      Group.create(name: 'Lena', size_type: :special),
      Group.create(name: 'Veronika', size_type: :special),
      Group.create(name: 'Bogdan', size_type: :special)
    ]

    ap '------------- groups created'
  end

  def create_user_in_groups
    family = Group.find_by(name: 'Family')
    friends = Group.find_by(name: 'Friends')
    lena = Group.find_by(name: 'Lena')
    veronika = Group.find_by(name: 'Veronika')
    bogdan = Group.find_by(name: 'Bogdan')

    @users[0..19].each.with_index {|u, i| UserInGroup.create group: family, user: u, owner: i == 0 }
    ([@users[0]] + @users[20..25]).each.with_index {|u, i| UserInGroup.create group: friends, user: u, owner: i == 0 }
    ([@users[0], @users[26]]).each.with_index {|u, i| UserInGroup.create group: lena, user: u, owner: i == 0 }
    ([@users[0], @users[27]]).each.with_index {|u, i| UserInGroup.create group: veronika, user: u, owner: i == 0 }
    ([@users[0], @users[28]]).each.with_index {|u, i| UserInGroup.create group: bogdan, user: u, owner: i == 0 }

    ap '------------- user-in-groups created'
  end

  def create_activities
    Group.where(id: @groups.map(&:id)).includes(:user_in_groups).each do |group|
      group.user_in_groups.each do |group_user|
        (1..5).to_a.sample.times do |i|
          Activity.create({
            latitude: 50.4414 + rand() * (0.18),
            longitude: 30.493 + rand() * (30.6920 - 30.5030),
            user_in_group_id: group_user.id,
            description: Faker::Matz.quote,
            created_at: Time.now - (1.day * rand()).to_i
          })
        end
      end
    end

    ap '------------- activities created'
  end
end
