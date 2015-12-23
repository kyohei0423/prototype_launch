class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_user, only: :show

  def show
    @kept_questions = @user.kept_questions
    @answered_questions = @user.answered_questions
    @unanswered_questions = @user.unanswered_questions
  end

  private
    def set_user
      @user = User.includes(:questions).find params[:id]
    end
end
