# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save user' do
    user = User.new(email: 'whatever@example.com', password: 'whatever', password_confirmation: 'whatever')
    user.skip_confirmation!
    assert user.save
  end

  test 'should not save user without email' do
    user = User.new
    assert_not user.save
  end
end
