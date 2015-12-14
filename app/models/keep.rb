class Keep < ActiveRecord::Base
  belongs_to :question, counter_cace: :keeps_count
  belongs_to :user
end
