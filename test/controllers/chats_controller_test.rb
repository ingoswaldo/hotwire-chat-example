# frozen_string_literal: true

class ChatsControllerTest < BaseControllerTest
  test 'should create a chat' do
    sign_in users(:confirmed)
    post chats_path(format: :turbo_stream), params: { chat: { receiver_id: users(:one).id } }
    assert_response :success
  end

  test 'should not create a chat' do
    sign_in users(:confirmed)
    post chats_path, params: { chat: { receiver_id: nil } }
    assert_response :unprocessable_entity
  end
end
