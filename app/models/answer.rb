class Answer < ActiveRecord::Base
  balongs_to :question

  validates :sentence, presence: true
end
