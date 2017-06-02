require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def self.current_user(user_id)
    User.get(user_id)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
