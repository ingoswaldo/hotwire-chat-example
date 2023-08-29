# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup = @subject = User.new(full_name: 'John Doe', email: 'john.doe@example.com', password: 'password')

  def test_has_many_creators = assert_respond_to(@subject, :creators)

  def test_has_many_receivers = assert_respond_to(@subject, :receivers)

  def test_has_many_messages = assert_respond_to(@subject, :messages)

  def test_saves_user_with_valid_attributes = assert @subject.valid?

  def test_requires_email
    @subject.email = nil
    assert_not @subject.valid?
  end

  def test_requires_full_name
    @subject.full_name = nil
    assert_not @subject.valid?
  end
end
