# frozen_string_literal: true

module Avatarable
  extend ActiveSupport::Concern

  included do
    def avatar(**options) = Initials.svg(full_name, **options)
  end
end
