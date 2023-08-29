# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup = @subject = Message.new(message: 'whatever', chat: chats(:one), user: users(:two))

  def test_belongs_to_chat = assert_respond_to(@subject, :chat)

  def test_belongs_to_user = assert_respond_to(@subject, :user)

  def test_saves_message_with_valid_attributes = assert @subject.valid?

  def test_requires_message
    @subject.message = nil
    assert_not @subject.valid?
  end
end
