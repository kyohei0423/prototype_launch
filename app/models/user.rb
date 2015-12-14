class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :nickname
  validates_presence_of :nickname, :avatar
end
