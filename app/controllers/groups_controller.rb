class GroupsController < ApplicationController
  before_action :set_group, only: :show

  def index
  end

  def show
  end

  private

    def set_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
