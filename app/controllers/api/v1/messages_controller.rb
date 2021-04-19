class Api::V1::MessagesController < Api::V1::BaseController
  # before_action :set_message, only: [:show]

  def index
    @messages = Message.all
    # find the user
    id = params[:user_id]
    # @messages = @messages.where("user_id = ? OR receiver_id = ?", id, id).order(created_at: :desc)
    @messages = User.find_by_sql ["SELECT DISTINCT users.* FROM users JOIN messages ON messages.receiver_id = users.id WHERE messages.user_id = ?", id]
    # user_messages = @messages.where(receiver_id: id).order(created_at: :desc)

    # group order by created at
    # order by receiver_id
    # ordered_messages = user_messages.map{ |message| [message.receiver_id, message.receiver.wechat_account, User.find(message.user_id).avatar]}.uniq
    # show the last received on top(in view/frontend?)

    # render json: {
    #   messages: ordered_messages
    # }

    # select distinct
    # @messages = user.messages
  end

  def show
    @messages = Message.all
    # find the user
    sender_id = params[:user_id]
    receiver_id = params[:receiver_id]

    @messages = @messages.where("(user_id = :sender AND receiver_id = :receiver) OR (user_id = :receiver AND receiver_id = :sender)", sender: sender_id, receiver: receiver_id).order(created_at: :asc)

    # get the messages where the received id is params receiver id


    # need to pass on frontend wx.request @path = "/api/v1/users/:user_id/messages/show?receiver_id=${receiver_id}"


  end


  def create
    # receive data
    # user = set_user
    # create a new message
    # broadcast with action cable the message we just created
    @message = Message.new(message_params)
    @message.user = User.find(params[:user_id])
    @message.receiver = User.find(params[:receiver_id])
    if @message.save
      # ActionCable.server.broadcast 'messages', #try message_channel if doesn't work
      #   message: message.content,
      #   user: message.user
      # head :ok
      render json: { msg: 'sent', message: @message }
    else
      render_error
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :receiver_id, :content)
  end

  def set_user
    @user = User.find_by(open_id: params[:open_id])
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
