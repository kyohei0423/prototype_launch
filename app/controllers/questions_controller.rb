class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :sentence, :time_limit)
  end
end
