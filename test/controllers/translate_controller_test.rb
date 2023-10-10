# frozen_string_literal: true

class TranslateControllerTest < BaseControllerTest
  def setup
    sign_in users(:spanish)
  end

  def test_translate_a_message
    mock_translator_service = Minitest::Mock.new
    mock_translator_service.expect(:call, 'hola', %w[hello es])
    Messages::Translator.stub(:call, mock_translator_service, ) do
      post translate_path, params: { message: 'hello', source_language: 'en' }
      assert_response :success
    end
  end
end
