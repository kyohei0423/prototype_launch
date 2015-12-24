class QuestionsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  enum status: %i(answered unanswered)

  STATUS = [
    ANSWERED    = 0,
    UNANSWERED  = 1
  ]
end
