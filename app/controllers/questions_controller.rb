class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :set_question, only: [:show, :edit, :destroy, :edit, :update]
  before_action :set_question_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:edit, :new]

  def show
    @answered_users = @question.reacting_users.where(questions_users:{status: QuestionsUser::ANSWERED})
  end

  def new
    @question = Question.new
    @groups = current_user.groups.present? ? current_user.groups.map{ |group| [group.name, group.id] } : []
  end

  def create
    @question = current_user.questions.new(question_params)
    @question.private = true if question_params[:group_id] != nil
    binding.pry
    if @question.save
      redirect_to question_path(@question), notice: '問題の投稿が完了しました。'
    else
      render :new
    end
  end

  def edit
    @groups = current_user.groups.present? ? current_user.groups.map{ |group| [group.name, group.id] } : []
    render :new
  end

  def update
    @question.private = true if question_params[:group_id] != nil
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render action: :new
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private
    def set_question
      @question = Question.includes(:questions_users, :keeps, :comments).find params[:id]
    end

    def question_params
      params.require(:question).permit(:title, :sentence, :time_limit, :tag_list, :description, :group_id)
    end

    def set_question_tags_to_gon
      gon.question_tags = @question.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Question.tags_on(:tags).pluck(:name)
    end
end
