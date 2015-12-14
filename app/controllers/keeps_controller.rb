class KeepsController < ApplicationController
  def create
    Keep.create(user_id: current_user.id, question_id: params[:question_id])
    @question = Question.find(params[:question_id])
  end

  def destroy
    keep = Keep.find(params[:id])
    keep.destroy
    @question = Question.find(params[:question_id])
  end
end
