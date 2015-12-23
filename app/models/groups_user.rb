class GroupsUser < ActiveRecord::Base
  belongs_to :group_id
  belongs_to :user_id
end
