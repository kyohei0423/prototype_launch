class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # mount_uploader :image, ImageUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.new(
        uid:        auth.uid,
        provider:   auth.provider,
        email:      User.dummy_email(auth),
        password:   Devise.friendly_token[0, 20],
        token:      auth.credentials.token,
        name:       auth.info.name,
        image:      auth.info.image
      )
      user.save validate: false
    end
    user
  end

  private
    def self.dummy_email(auth)
      "uovo.aureo.000@gmail.com"
    end
end
