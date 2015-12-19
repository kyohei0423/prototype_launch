class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reacted_questions, through: :questions_users, source: :question
  has_many :questions, dependent: :destroy
  has_many :questions_users
  has_many :kept_questions, through: :keeps, source: :question
  has_many :keeps
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :nickname
  validates_presence_of :nickname, :avatar

  def update_level(question)
    question_ex_point = question.level
    self.ex_point += question_ex_point
    self.level = ((10 * (self.ex_point - 3))**(1/2.0)).floor
    self.update(level: self.level)
  end
end
