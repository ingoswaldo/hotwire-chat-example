# frozen_string_literal: true

module Users
  module Scopeable
    extend ActiveSupport::Concern

    included do
      scope :chats_created_by, ->(creator_id) { joins(:creators).where(creators: { creator_id: }) }
      scope :chats_received_by, ->(receiver_id) { joins(:receivers).where(receivers: { receiver_id: }) }
      scope :except_chatting_with, lambda { |id|
        where.not(id:).where.not(id: chats_created_by(id).select(:receiver_id))
             .where.not(id: chats_received_by(id).select(:creator_id))
      }
    end
  end
end
