class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reacted_questions, through: :questions_users, source: :question
  has_many :questions, dependent: :destroy
  has_many :questions_users
  has_many :kept_questions, through: :keeps, source: :question
  has_many :keeps
  has_many :answers, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :nickname
  validates_presence_of :nickname, :avatar

  scope :answered_questions, -> {@user.reacted_questions.where(questions_users:{status: QuestionsUser::ANSWERED})}
end
