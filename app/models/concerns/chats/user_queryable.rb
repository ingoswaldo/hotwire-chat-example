# frozen_string_literal: true

module Chats
  module UserQueryable
    extend ActiveSupport::Concern

    included do
      belongs_to :creator, class_name: 'User', inverse_of: :creators
      belongs_to :receiver, class_name: 'User', inverse_of: :receivers
    end
  end
end
