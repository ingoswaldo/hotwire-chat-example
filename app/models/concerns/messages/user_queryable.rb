# frozen_string_literal: true

module Messages
  module UserQueryable
    extend ActiveSupport::Concern

    included do
      belongs_to :user, class_name: 'User', inverse_of: :messages
    end
  end
end
