class Api::V1::UsersController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  before_action :set_user, only: [:show, :update]

  def index
    # display the users in the homepage
    @users = User.all
    # render json: @users
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

  def login
    # user can login/signin in the app
    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: {
      userId: @user.id
    }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:wechat_account, :role, :location, :status, :open_id, photos: [])
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end


  def wechat_user
    wechat_params = {
      appId: Rails.application.credentials.dig(:wechat_app_id),
      secret: Rails.application.credentials.dig(:wechat_app_secret),
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end
end
