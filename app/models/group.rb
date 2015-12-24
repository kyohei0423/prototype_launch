class Group < ActiveRecord::Base
  has_many :groups_users
  has_many :users, through: :groups_users, source: :user

  validates_uniqueness_of :name, message: 'already saved with the name', case_sensitive: true
  validates_presence_of :name

  mount_uploader :thumbnail, ThumbnailUploader

  def owner_is?(user)
    groups_users.owner.exists?(user_id: user.id)
  end
end
