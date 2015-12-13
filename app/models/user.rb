class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :reacted_questions, through: :questions_users, source: :questions
  has_many :answers
  has_many :questions_users
end
