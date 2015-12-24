class GroupsController < ApplicationController
  before_action :set_group, only: :show

  def index
  end

  def show
    render layout: 'group_page'
  end

  private

    def set_group
      @group = Group.find params[:id]
    end
end
