# frozen_string_literal: true

module Shared
  module Lists
    class ListItemComponent < ViewComponent::Base
      def initialize(text:, negative_check:)
        super
        @text = text
        @negative_check = negative_check
      end
    end
  end
end
