# frozen_string_literal: true

module Users
  module Validatable
    extend ActiveSupport::Concern

    included do
      validates :full_name, presence: true
    end
  end
end
