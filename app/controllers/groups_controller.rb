class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:index, :show]

  layout 'group_page', only: [:show, :edit]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

    def set_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit(:name, :thumbnail)
    end
end
