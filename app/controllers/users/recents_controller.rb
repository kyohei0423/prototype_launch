class Users::RecentsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @questions = @user.questions.order(updated_at: :desc)
    render layout: 'user_page', file: '/users/show'
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
