# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  test 'should save chat' do
    chat = Chat.new(creator: users(:one), receiver: users(:confirmed))
    assert chat.save
  end

  test 'should not save chat without creator and receiver' do
    chat = Chat.new
    assert_not chat.save
  end
end
