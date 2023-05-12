# frozen_string_literal: true

require 'test_helper'

class BaseControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
