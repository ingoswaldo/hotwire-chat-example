# frozen_string_literal: true

require 'test_helper'

module Layout
  module Chat
    class UserComponentTest < ViewComponent::TestCase
      def test_render_component
        render_inline(UserComponent.new(chat: chats(:one), user_logged_in: users(:confirmed)))

        assert_text(chats(:one).receiver.full_name)
      end
    end
  end
end
