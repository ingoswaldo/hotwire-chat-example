# frozen_string_literal: true

module Layout
  module Chat
    class MessagesComponent < ViewComponent::Base
      def initialize(chat:, user_logged_in:)
        @user_logged_in = user_logged_in
        @chat = chat
        super
      end

      def creator? = @chat.creator == @user_logged_in

      def user = @user ||= creator? ? @chat.receiver : @chat.creator

      def messages = @messages ||= @chat.messages
    end
  end
end
