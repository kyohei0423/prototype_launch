class Question < ActiveRecord::Base
  belongs_to :user
  validates :title, :sentence, presence: true
end
