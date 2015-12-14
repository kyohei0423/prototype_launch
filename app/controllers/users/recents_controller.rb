class Users::RecentsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.questions.order(updated_at: :desc)
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
