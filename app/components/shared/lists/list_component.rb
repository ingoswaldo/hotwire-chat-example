# frozen_string_literal: true

module Shared
  module Lists
    class ListComponent < ViewComponent::Base
      renders_many :items, ListItemComponent
    end
  end
end
