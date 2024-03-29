class Group < ActiveRecord::Base
  has_many :groups_users
  has_many :users, through: :groups_users, source: :user, dependent: :delete_all
  has_many :questions

  validates_uniqueness_of :name, message: 'already saved with the name', case_sensitive: true
  validates_presence_of :name, :thumbnail

  mount_uploader :thumbnail, ThumbnailUploader

  def owner_is?(user)
    groups_users.owner.exists?(user_id: user.id)
  end

  def has_the_user?(user_id)
    users.exists?(id: user_id)
  end
end
