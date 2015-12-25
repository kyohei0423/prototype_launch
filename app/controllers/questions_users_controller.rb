class QuestionsUsersController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_question, only: :create

  def create
    current_user.questions_users.create(questions_user_params)
    if params[:status] == "answered"
      @pre_user_level = current_user.level
      current_user.update_level(@question)
      @new_user_level = current_user.level
    end
  end

  private

    def questions_user_params
      params.permit(:question_id, :status)
    end

    def set_question
      @question = Question.find params[:question_id]
    end
end
