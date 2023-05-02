# frozen_string_literal: true

module Chats
  module Validatable
    extend ActiveSupport::Concern

    included do
      validates :creator_id, uniqueness: { scope: :receiver_id }
    end
  end
end
