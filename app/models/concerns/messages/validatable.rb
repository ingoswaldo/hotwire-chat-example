# frozen_string_literal: true

module Messages
  module Validatable
    extend ActiveSupport::Concern

    included do
      validates :message, presence: true
    end
  end
end
