# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'should save message' do
    message = Message.new(message: 'whatever', chat: chats(:one))
    assert message.save
  end

  test 'should not save message without message' do
    message = Message.new
    assert_not message.save
  end
end
