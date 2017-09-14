class LoginService
  def initialize(fb_token)
    @koala = Koala::Facebook::API.new(fb_token)
  end

  def call
    fields = ['email', 'first_name', 'last_name','link','gender','locale','picture']
    user_data = @koala.get_object('me', {fields: fields})

    user = User.find_by(email: user_data['email'])
    if user
      user.regenerate_auth_token
      user.reload
    else
      User.create({
        email: user_data['email'],
        full_name: "#{user_data['first_name']} #{user_data['last_name']}",
        gender: user_data['gender'],
        picture: user_data['picture']['data']['url'],
        locale: user_data['locale'],
        facebook_link: user_data['link'],
        facebook_id: user_data['id'],
      })
    end
  end
end
