class KeepsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    current_user.keeps.create(keeps_params)
    @question = Question.find(params[:question_id])
  end

  def destroy
    Keep.find(params[:id]).destroy
    @question = Question.find(params[:question_id])
  end

  private

    def keeps_params
      params.permit(:question_id)
    end
end
