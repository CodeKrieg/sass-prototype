class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_many :conversations, :foreign_key => :sender_id
  has_many :friendships
  has_many :friends, through: :friendships
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
  
    def not_friends_with?(friend_id)
        friendships.where(friend_id: friend_id).count < 1
    end
    
    def except_current_user(users)
        users.reject {|user| user.id == self.id}
    end
 
    def self.search(param)
        return User.none if param.blank?
        param.strip!
        param.downcase!
        (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    end
    
    def self.first_name_matches(param)
        matches('first_name', param)
    end
    
    def self.last_name_matches(param)
        matches('last_name', param)
    end
    
    def self.email_matches(param)
        matches('email', param)
    end
    
    def self.matches(field_name, param)
        where("lower(#{field_name}) like ?", "%#{param}%")
    end
end
