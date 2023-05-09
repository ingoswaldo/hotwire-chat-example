# frozen_string_literal: true

module Users
  module Messageable
    extend ActiveSupport::Concern

    included do
      has_many :messages, class_name: 'Message', foreign_key: :user_id, inverse_of: :user, dependent: :destroy
    end
  end
end
