class Users::GroupsController < UsersController
  layout 'user_page'

  before_action :set_group, only: :show

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
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
    Group.find(params[:id]).destroy
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
