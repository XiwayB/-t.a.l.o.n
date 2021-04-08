class Api::V1::UsersController < Api::V1::BaseController
  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze
  before_action :set_user, only: [:show, :update, :update_photo]

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

  def update_photo
    photo = params[:photo]
    p '======================= PHOTO =========================', photo
    @user.photos.attach(photo)
    render json: {status: 200, msg: "Photo attached"} if @user.save
    puts "---------------ERROR-----------------"

    # if @user.update(photos_params)
    # else
    #   render_error
    # end
  end

  def login
    # user can login/signin in the app
    open_id = wechat_user.fetch("openid")
    @user = User.find_or_create_by(open_id: open_id)
    render json: {
      userId: @user.id,
      hasUserInfo: @user.wechat_account.present?,
      currentUser: @user

    }
  end

  private

  def set_user
    p "user", params[:id]
    id = params[:id]
    user = User.find(id.to_i)
    p "user", user
    @user = user
  end

  def user_params
    params.require(:user).permit(:wechat_account, :role, :pictures, :status, :open_id, photos: [], location: {})
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
