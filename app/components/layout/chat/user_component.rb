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

      def last_message = @messages&.last&.message || 'No messages yet'

      def messages = @messages ||= @chat.messages

      def time
        return unless last_message.respond_to?(:created_at)

        time = last_message.created_at
        return time.strftime('%H:%M') if time.to_date == Time.zone.today

        'yesterday'
      end

      def user = @user ||= creator? ? @chat.receiver : @chat.creator
    end
  end
end
