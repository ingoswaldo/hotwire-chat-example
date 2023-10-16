# frozen_string_literal: true

require 'test_helper'

module Shared
  module Lists
    class ListItemComponentTest < ViewComponent::TestCase
      def test_render_component
        render_inline(ListItemComponent.new(text: 'My item', negative_check: false))

        assert_text('My item')
      end
    end
  end
end
