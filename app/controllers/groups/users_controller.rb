class Groups::UsersController < GroupsController
  before_action :set_group, only: :index

  layout 'group_page'

  def index
    @users = @group.users
  end

  private

    def set_group
      @group = Group.find params[:group_id]
    end
end
