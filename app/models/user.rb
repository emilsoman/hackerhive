class User < ActiveRecord::Base

  has_many :authentications

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :omniauth_providers => [:facebook, :github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation

  def self.find_or_create_auth(auth, current_user)
    authentication = Authentication.where(provider: auth.provider, uid: auth.uid).first
    if authentication
      user = current_user || authentication.user
    else
      user = current_user || User.create(name:auth.extra.raw_info.name, email: auth.info.email)
      auth = Authentication.create(user_id: user.id, provider: auth.provider, uid: auth.uid)
    end
    user
  end

end
