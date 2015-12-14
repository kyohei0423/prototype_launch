class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_question, only: [:show, :edit, :destroy, :edit, :update]
  before_action :set_question_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:edit, :new]

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

  def edit
    render :new
  end

  def update
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy
    redirect_to :back
  end

  private
    def set_question
      @question = Question.includes(:questions_users, :keeps).find params[:id]
    end

    def question_params
      params.require(:question).permit(:title, :sentence, :time_limit, :tag_list, :description)
    end

    def set_question_tags_to_gon
      gon.question_tags = @question.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Question.tags_on(:tags).pluck(:name)
    end
end
