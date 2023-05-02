# frozen_string_literal: true

module Chats
  module Messageable
    extend ActiveSupport::Concern

    included do
      has_many :messages, class_name: 'Message', foreign_key: :chat_id, inverse_of: :chat, dependent: :destroy
    end
  end
end
