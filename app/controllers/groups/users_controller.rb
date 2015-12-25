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
    if @group.has_the_user?(params[:user_id])
      flash[:alert] = "このユーザーは既にグループに入っています。"
      redirect_to new_group_user_path(@group)
    else
      @group.groups_users.create(user_id: params[:user_id], status: GroupsUser::MEMBER)
      flash[:notice] = "ユーザーの追加に成功しました。"
      redirect_to group_users_path(@group)
    end
  end

  private

    def set_group
      @group = Group.find params[:group_id]
    end
end
