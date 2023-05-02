# frozen_string_literal: true

module Users
  module Chatable
    extend ActiveSupport::Concern

    included do
      has_many :creators, class_name: 'Chat', foreign_key: :creator_id, inverse_of: :creator, dependent: :destroy
      has_many :receivers, class_name: 'Chat', foreign_key: :receiver_id, inverse_of: :receiver, dependent: :destroy
    end
  end
end
