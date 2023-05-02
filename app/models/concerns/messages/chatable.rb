# frozen_string_literal: true

module Messages
  module Chatable
    extend ActiveSupport::Concern

    included do
      belongs_to :chat, class_name: 'Chat', inverse_of: :messages

      enum status: {
        sent: 0, received: 1, read: 2
      }
    end
  end
end
