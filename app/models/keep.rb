class Keep < ActiveRecord::Base
  belongs_to :question, counter_cache: :keeps_count
  belongs_to :user
end
