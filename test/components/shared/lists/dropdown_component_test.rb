# frozen_string_literal: true

require 'test_helper'

module Shared
  module Lists
    class DropdownComponentTest < ViewComponent::TestCase
      def test_render_component
        dropdown_component = DropdownComponent.new.tap do |dropdown|
          dropdown.with_header { 'Title' }
          dropdown.with_item { 'Item 1' }
          dropdown.with_item { 'Item 2' }
        end

        render_inline(dropdown_component)

        assert_selector('ul')
        assert_selector('li', text: 'Item 1')
        assert_selector('li', text: 'Item 2')
      end
    end
  end
end
