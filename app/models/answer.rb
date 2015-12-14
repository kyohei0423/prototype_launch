class Answer < ActiveRecord::Base
  belongs_to :question, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :sentence, presence: true
end
