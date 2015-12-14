class Users::AnsweredQuestionsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.answered_questions
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
