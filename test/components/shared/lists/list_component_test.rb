# frozen_string_literal: true

require 'test_helper'

module Shared
  module Lists
    class ListComponentTest < ViewComponent::TestCase
      def test_render_component
        list_component = ListComponent.new.tap do |list|
          list.with_item(text: 'Apple', negative_check: false)
          list.with_item(text: 'Orange', negative_check: false)
        end

        render_inline(list_component)

        assert_selector('ul')
        assert_selector('li', text: 'Apple')
        assert_selector('li', text: 'Orange')
      end
    end
  end
end
