# frozen_string_literal: true

class ChatsControllerTest < BaseControllerTest
  def setup = sign_in users(:confirmed)

  def test_gets_index
    get chats_path
    assert_response :success
  end

  def test_gets_new
    get new_chat_path
    assert_response :success
  end

  def test_creates_a_chat
    post chats_path(format: :turbo_stream), params: { chat: { receiver_id: users(:one).id } }
    assert_response :success
  end

  def test_does_not_create_a_chat
    post chats_path, params: { chat: { receiver_id: nil } }
    assert_response :unprocessable_entity
  end
end
