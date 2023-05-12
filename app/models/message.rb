# frozen_string_literal: true

class Message < ApplicationRecord
  include Messages::Chatable
  include Messages::UserQueryable
  include Messages::Validatable
end
