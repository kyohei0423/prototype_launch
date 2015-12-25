class Groups::UsersController < GroupsController
  before_action :set_group, only: [:index, :new, :create]

  layout 'group_page'

  def index
    @users = @group.users
  end

  def new
    @users = User.where('email LIKE(?)', "%#{params[:user_email]}%")
  end

  def create
    @group.groups_users.create(user_id: params[:user_id], status: GroupsUser::MEMBER)
    redirect_to group_users_path(@group)
  end

  private

    def set_group
      @group = Group.find params[:group_id]
    end
end
