class Question < ActiveRecord::Base

  belongs_to :user
  has_one :answer, dependent: :destroy
  has_many :comments, as: :commentable

  validates :title, :sentence, presence: true

  acts_as_taggable

  def has_answer?
    answer.present?
  end

  def belongs_to?(viewer)
    self.user == viewer
  end
end
