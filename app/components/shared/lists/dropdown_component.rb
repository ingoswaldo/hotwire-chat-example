# frozen_string_literal: true

module Shared
  module Lists
    class DropdownComponent < ViewComponent::Base
      renders_one :header
      renders_many :items, DropdownItemComponent
    end
  end
end
