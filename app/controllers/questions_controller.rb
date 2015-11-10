class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.question.create(create_params)
  end

  private
  def create_params
    params.require(:question).permit(:title, :sentence, :time_limit)
  end
end
