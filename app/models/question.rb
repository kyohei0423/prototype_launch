class Question < ActiveRecord::Base
  include Math

  has_one :answer, dependent: :destroy
  has_many :questions_users
  has_many :reacting_users, through: :questions_users, source: :user
  has_many :keeps
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :group

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
    questions_users.answered.count
  end

  def count_unanswered_users
    questions_users.unanswered.count
  end

  def update_level
    total_users = reacting_users.count
    unanswered_users = questions_users.unanswered.count*10
    result = unanswered_users.divmod(total_users)
    base = result[1] == 0 ? result[0] : result[0] + 1
    level = (10 / (exp(-(base - 5)/1.5) + 1)).round
    update(level: level)
  end
end

