class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_question, only: :show
  before_action :ser_user, only: :show

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to question_path(@question), notice: '問題の投稿が完了しました。'
    else
      render :new
    end
  end

  private
    def ser_user
      @user = User.find(params[:id])
    end

    def set_question
      @question = Question.find params[:id]
    end

    def question_params
      params.require(:question).permit(:title, :sentence, :time_limit)
    end
end
