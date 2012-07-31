class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  has_many :own_events, :foreign_key => "owner_id", :class_name => "Event"
  has_many :joins, :class_name => "Event::Join"
  has_many :events, :through => :joins


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :admin
  # attr_accessible :title, :body
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    logger.info "\n\n\n FACEBOOK: #{auth.info}\n\n\n"
    unless user
      user = User.create(
                          name: auth.info.name,
                          provider: auth.provider,
                          uid: auth.uid,
                          email: auth.info.email,
                          password: Devise.friendly_token[0,20]
                        )
    end
    user
  end
end
