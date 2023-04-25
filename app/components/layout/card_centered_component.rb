# frozen_string_literal: true

module Layout
  class CardCenteredComponent < ViewComponent::Base
    def initialize(title:)
      super
      @title = title
    end
  end
end
