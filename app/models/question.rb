class Question < ActiveRecord::Base
  belongs_to :user
  has_one :answer, dependent: :destroy
  has_many :questions_users
  has_many :reacting_users, through: :questions_users, source: :user
  has_many :keeps

  validates :title, :sentence, presence: true

  acts_as_taggable

  def fetch_created_date
    created_at.strftime('%Y年%m月%d日 %H時%m分')
  end

  def has_answer?
    answer.present?
  end

  def belongs_to?(viewer)
    user == viewer
  end

  def reacted_by?(user)
    questions_users.exists?(user_id: user.id)
  end

  def kept_by?(user)
    keeps.exists?(user_id: user.id)
  end

  def user_keep(user)
    keeps.find_by(user_id: user.id)
  end

  def count_answered_users
    questions_users.count(status: 'answered')
  end

  def count_unanswered_users
    questions_users.count(status: 'unanswered')
  end
end

