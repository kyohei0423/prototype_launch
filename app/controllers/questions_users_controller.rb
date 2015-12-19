class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    current_user.questions_users.create(questions_user_params)
    @question = Question.find(params[:question_id])
    @question_level = 7
    exp = @question

    current_user.exp += exp
    current_user.exp = (10(current_ues.exp-3))**(1/2.0)
    binding.pry
  end

  private
  def questions_user_params
    params.permit(:question_id, :status)
  end
end
