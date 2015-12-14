class Users::AnsweredQuestionsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.reacted_questions.where(questions_users:{status: QuestionsUser::ANSWERED})
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
