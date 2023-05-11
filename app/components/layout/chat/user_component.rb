# frozen_string_literal: true

module Layout
  module Chat
    class UserComponent < ViewComponent::Base
      def initialize(chat:, user_logged_in:)
        @chat = chat
        @user_logged_in = user_logged_in
        super
      end

      def creator? = @chat.creator == @user_logged_in

      def user = @user ||= creator? ? @chat.receiver : @chat.creator
    end
  end
end
