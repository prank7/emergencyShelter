class User < ActiveRecord::Base
   before_create :generate_token

  def self.find_with_omniauth(auth)
    find_by(uid: auth)
  end

  def self.create_with_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.image = auth.info.image
        user.save!
        return user
    end
  end

  def self.create_by_android(info)
    user = User.new
    user.provider = info["provider"]
    user.uid = info["id"]
    user.name = info["name"]
    user.email = info["email"]
    user.image = info["picture"]
    user.save!
    return user
  end


  def generate_token
    self.api_key = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless self.class.exists?(api_key: random_token)
    end
  end



end
