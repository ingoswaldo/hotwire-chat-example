class MessagesController < ApplicationController
  before_action :set_user
  before_action :set_chat

  def index
    @messages = @chat.messages
    render layout: false
  end

  def new; end

  def create
    @message = @user.messages.create(message_params.merge({ chat: @chat }))

    respond_to do |format|
      return format.turbo_stream if @message.save

      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def set_chat = @chat = @user.my_chats.find(params[:chat_id])

  def set_user = @user = current_user

  def message_params = params.fetch(:message, {}).permit(:message)
end
