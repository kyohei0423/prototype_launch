class AnswersController < ApplicationController
  before_action :set_question, only: [:new, :create, :show]
  before_action :set_answer, only: :show
  before_action :authenticate_user!, only: :new

  def show
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.build_answer(answer_params)
    if @answer.save
      redirect_to question_answer_path(@question, @answer), notice: '解答の投稿が完了しました。'
    else
      render :new
    end
  end

  private
    def set_question
      @question = Question.find params[:question_id]
    end

    def set_answer
      @answer = Answer.find params[:id]
    end

    def answer_params
      params.require(:answer).permit(:sentence).merge(user_id: current_user.id)
    end
end
