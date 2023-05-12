# frozen_string_literal: true

class MessagesControllerTest < BaseControllerTest
  setup do
    @chat = users(:confirmed).creators.create(receiver: users(:one))
  end

  test 'should create a message' do
    sign_in users(:confirmed)
    post chat_messages_path(@chat, format: :turbo_stream), params: { message: { message: 'message' } }
    assert_response :success
  end

  test 'should not create a message' do
    sign_in users(:confirmed)
    post chat_messages_path(@chat), params: { message: { message: nil } }
    assert_response :unprocessable_entity
  end
end
