class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.create(create_params)
    if @question.title.empty? && @question.sentence.empty?
      flash[:alert] = "Title and Sentence can't be blank."
      redirect_to action: :new
    elsif @question.title.empty?
      flash[:alert] = "Title can't be blank."
      redirect_to action: :new
    elsif @question.sentence.empty?
      flash[:alert] = "Sentence can't be blank"
      redirect_to action: :new
    else
      redirect_to :root
    end
  end

  private
  def create_params
    params.require(:question).permit(:title, :sentence, :time_limit)
  end
end
