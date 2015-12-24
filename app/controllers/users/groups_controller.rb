class Users::GroupsController < UsersController
  layout 'user_page'

  before_action :set_group, only: [:show, :update, :destory]

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
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def destroy
    @group.destroy
    redirect_to user_path(current_user)
  end

  private

    def set_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit(:name)
    end
end
