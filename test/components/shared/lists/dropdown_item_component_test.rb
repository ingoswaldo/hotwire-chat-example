# frozen_string_literal: true

require 'test_helper'

module Shared
  module Lists
    class DropdownItemComponentTest < ViewComponent::TestCase
      def test_render_component
        render_inline(DropdownItemComponent.new) { 'Item' }

        assert_text('Item')
      end
    end
  end
end
