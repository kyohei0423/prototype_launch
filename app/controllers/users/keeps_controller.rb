class Users::KeepsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.kept_questions
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
