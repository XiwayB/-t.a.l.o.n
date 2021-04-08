class UsersController < ApplicationController
before_action :set_user, only: [:show, :update]
  def index
    # display the users in the homepage
    @users = User.all
    # render json: @users
  end

  def new
    @user = User.new
  end

  def create
    @user =User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show; end

  def update
    # a user can update the status/role
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:wechat_account, :role, :pictures, :location, :status, :open_id, photos:[])
  end

end
