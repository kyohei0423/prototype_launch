class GroupsUser < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  enum status: %i(owner member)

  STATUS = [
    OWNER  = 0,
    MEMBER = 1
  ]
end
