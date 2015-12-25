class AnswersController < ApplicationController
  before_action :set_question, only: [:new, :create, :show, :edit, :update]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :show, :create]
  before_action :check_reacted_user, only: :show

  def show
    @answered_users = @question.reacting_users.where(questions_users:{status: QuestionsUser::ANSWERED})
    @comment = Comment.new
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

  def edit
    render :new
  end

  def update
    if @answer.update(answer_params)
      redirect_to question_answer_path(@question, @answer)
    else
      render :new
    end
  end

  def destroy
    @answer.destroy
    redirect_to root_path
  end

  private

    def check_reacted_user
      redirect_to question_path(@question), id: @question.id unless @question.reacted_by?(current_user)
    end

    def set_question
      @question = Question.includes(:questions_users, :keeps, :comments).find params[:question_id]
    end

    def set_answer
      @answer = Answer.find params[:id]
    end

    def answer_params
      params.require(:answer).permit(:sentence).merge(user_id: current_user.id)
    end
end
