# frozen_string_literal: true

require 'test_helper'

module Layout
  class CardCenteredComponentTest < ViewComponent::TestCase
    def test_render_component
      render_inline(CardCenteredComponent.new(title: 'My title'))

      assert_text('My title')
    end
  end
end
