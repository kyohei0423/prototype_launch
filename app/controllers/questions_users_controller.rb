class QuestionsUsersController < ApplicationController
  def create
    QuestionsUser.create(user_id: current_user.id, question_id: params[:question_id], status: 0)
  end
end
