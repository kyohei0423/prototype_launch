class Answer < ActiveRecord::Base
  validates :sentence, presence: true
end
