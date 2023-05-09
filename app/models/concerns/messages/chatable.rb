# frozen_string_literal: true

module Messages
  module Chatable
    extend ActiveSupport::Concern

    included do
      belongs_to :chat, class_name: 'Chat', inverse_of: :messages

      after_create_commit :after_create_broadcast

      enum status: {
        sent: 0, received: 1, read: 2
      }
    end

    private

    def after_create_broadcast = broadcast_append_to 'messages-list'
  end
end
