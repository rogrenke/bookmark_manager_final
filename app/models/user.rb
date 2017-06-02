class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String

  def self.current_user(user_id)
    User.get(user_id)
  end

end
