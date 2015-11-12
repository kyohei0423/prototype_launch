class Answer < ActiveRecord::Base
  belongs_to :question

  validates :sentence, presence: true
end
