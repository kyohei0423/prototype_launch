class Users::GroupsController < UsersController
  layout 'user_page'

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :edit, :udpate,:destroy]

  def index
    @groups = @user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      GroupsUser.create(user_id: params[:user_id], group_id: @group.id, status: GroupsUser::OWNER)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    @group.update(group_params)
  end

  def destroy
    @group.destroy
    redirect_to user_groups_path(@user)
  end

  private

    def set_group
      @group = Group.find params[:id]
    end

    def set_user
      @user = User.find params[:user_id]
    end

    def group_params
      params.require(:group).permit(:name, :thumbnail)
    end
end
