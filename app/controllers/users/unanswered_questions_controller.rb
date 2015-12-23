class Users::UnansweredQuestionsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.unanswered_questions
    render layout: 'user_page', file: '/users/show'
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
