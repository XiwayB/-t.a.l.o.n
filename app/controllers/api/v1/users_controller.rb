class Api::V1::StoriesController < Api::V1::BaseController
  before_action :set_user, only: [:show]

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:wechat_account, :role, :pictures, :location, :status, :open_id)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
