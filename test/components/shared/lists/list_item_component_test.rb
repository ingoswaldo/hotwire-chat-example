# frozen_string_literal: true

require 'test_helper'

module Shared
  module Lists
    class ListItemComponentTest < ViewComponent::TestCase
      def test_component_renders_something_useful
        # assert_equal(
        #   %(<span>Hello, components!</span>),
        #   render_inline(Shared::ListItemComponent.new(message: "Hello, components!")).css("span").to_html
        # )
      end
    end
  end
end
