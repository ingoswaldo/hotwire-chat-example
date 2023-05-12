# frozen_string_literal: true

module Layout
  class CardCenteredComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
      super
    end
  end
end
