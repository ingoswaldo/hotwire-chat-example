# frozen_string_literal: true

module Messages
  module Chatable
    extend ActiveSupport::Concern

    included do
      belongs_to :chat, class_name: 'Chat', inverse_of: :messages

      after_create_commit { broadcast_append_to 'messages-list' }

      enum status: {
        sent: 0, received: 1, read: 2
      }
    end
  end
end
