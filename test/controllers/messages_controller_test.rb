# frozen_string_literal: true

class MessagesControllerTest < BaseControllerTest
  def setup
    @chat = users(:confirmed).creators.create(receiver: users(:one))
    @message = @chat.messages.create(message: 'whatever')
    sign_in users(:confirmed)
  end

  def test_gets_index
    get chat_messages_path(@chat)
    assert_response :success
  end

  def test_creates_a_message_with_valid_params
    post chat_messages_path(@chat, format: :turbo_stream), params: { message: { message: 'message' } }
    assert_response :success
  end

  def test_does_not_create_a_message_with_invalid_params
    post chat_messages_path(@chat), params: { message: { message: nil } }
    assert_response :unprocessable_entity
  end
end
