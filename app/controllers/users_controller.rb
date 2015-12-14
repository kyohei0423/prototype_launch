class UsersController < ApplicationController
  before_action :set_user, only: :show
  def show
    @questions = @user.questions
  end

  private
    def set_user
      @user = User.includes(:questions).find params[:id]
    end
end
