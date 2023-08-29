# frozen_string_literal: true

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  def setup = @subject = Chat.new(creator: users(:one), receiver: users(:confirmed))

  def test_belongs_to_creators = assert_respond_to(@subject, :creator)

  def test_belongs_to_receiver = assert_respond_to(@subject, :receiver)

  def test_has_many_messages = assert_respond_to(@subject, :messages)

  def test_saves_chat_with_valid_attributes = assert @subject.valid?

  def test_requires_creator
    @subject.creator = nil
    assert_not @subject.valid?
  end

  def test_requires_receiver
    @subject.creator = nil
    assert_not @subject.valid?
  end
end
