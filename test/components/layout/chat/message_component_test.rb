# frozen_string_literal: true

require 'test_helper'

module Layout
  module Chat
    class MessageComponentTest < ViewComponent::TestCase
      def test_render_component
        render_inline(MessagesComponent.new(chat: chats(:one), user_logged_in: users(:one)))

        assert_text(users(:two).full_name)
      end
    end
  end
end
