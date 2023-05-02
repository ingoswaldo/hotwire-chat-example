# frozen_string_literal: true

class Chat < ApplicationRecord
  include Chats::Messageable
  include Chats::Validatable
  include Chats::UserQueryable
end
