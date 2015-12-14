class QuestionsUsersController < ApplicationController
  def create
    current_user.questions_users.create(questions_user_params)
    @question = Question.find(params[:question_id])
  end

  private
  def questions_user_params
    params.permit(:question_id, :status)
  end
end
