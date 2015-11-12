class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :sentence, presence: true
end
