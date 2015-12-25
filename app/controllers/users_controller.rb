class UsersController < ApplicationController
  layout 'user_page'

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :thanks]
  before_action :set_group_user, except: [:show, :thanks]

  def show
  end

  def thanks
    @user.thanks += 1
    @user.save
  end

  private

    def set_user
      @user = User.includes(:questions).find params[:id]
    end

    def set_group_user
      @user = User.includes(:questions).find params[:user_id]
    end
end
