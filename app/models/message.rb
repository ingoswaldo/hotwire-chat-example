# frozen_string_literal: true

class Message < ApplicationRecord
  include Messages::Chatable
  include Messages::Validatable
end
