class QuestionsUsersController < ApplicationController
  def create
    QuestionsUser.create(user_id: current_user.id, question_id: params[:question_id], status: params[:status].to_i)

    @question = Question.find(params[:question_id])
  end
end
