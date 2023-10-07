# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  end
end
