class Question < ActiveRecord::Base
  belongs_to :user
  has_one :answer, dependent: :destroy
  has_many :questions_users
  has_many :reacting_users, through: :questions_users, source: :users
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

  def has_reaction?(user)
    questions_users.find_by(user_id: user.id)
  end

  def has_keep?(user)
    keeps.find_by(user_id: user.id)
  end
end
