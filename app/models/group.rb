class Group < ActiveRecord::Base
  has_many :users, through: :groups_users

  enum status: %i(owner member)

  validates_uniqueness_of :name, message: 'already saved with the name', case_sensitive: true
  validates_presence_of :name
end
