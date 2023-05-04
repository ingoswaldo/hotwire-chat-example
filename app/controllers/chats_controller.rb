# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_user
  before_action :set_chat_users, only: %i[new create]

  def index = @chats = @user.my_chats

  def new = @chat = Chat.new

  def create
    @chat = @user.creators.new(chat_params)

    respond_to do |format|
      return format.turbo_stream if @chat.save

      format.html { render :new, status: :unprocessable_entity }
    end
  end

  private

  def set_user = @user = current_user

  def set_chat_users = @users = User.except_chatting_with(@user.id)

  # Only allow a list of trusted parameters through.
  def chat_params = params.fetch(:chat, {}).permit(:receiver_id)
end
