# frozen_string_literal: true

class WelcomeControllerTest < BaseControllerTest
  test 'should get index' do
    sign_in users(:confirmed)
    get root_path
    assert_response :success
  end
end
