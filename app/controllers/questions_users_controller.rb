class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    current_user.questions_users.create(questions_user_params)
    @question = Question.find(params[:question_id])
    if params[:status] == "answered"
      current_user.update_level(@question)
    end
  end

  private
  def questions_user_params
    params.permit(:question_id, :status)
  end
end
