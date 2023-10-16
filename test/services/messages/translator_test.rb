# frozen_string_literal: true

require 'test_helper'

class TranslatorTest < ActiveSupport::TestCase
  def test_translates_a_text_with_valid_params
    translated_text = mock_google_translator_service(contents.first, target_language_code, mock_translations_response)
    assert_equal(translate_text, translated_text)
  end

  def test_does_not_translate_a_text_with_invalid_params
    assert_raises(ArgumentError) { translate_service_class.call(nil, nil) }
    assert_raises(ArgumentError) { translate_service_class.call('', '') }
    assert_raises(ArgumentError) { translate_service_class.call('whatever', nil) }
    assert_raises(ArgumentError) { translate_service_class.call(nil, 'es') }
  end

  def test_returns_nil_when_the_google_response_is_nil
    translated_text = mock_google_translator_service(contents.first, target_language_code, nil)
    assert_nil(translated_text)
  end

  private

  def contents = ['Hello, world!']

  def mock_translations_response = translations_struct.new([translate_text_struct.new(translate_text)])

  def parent = Rails.application.credentials.dig(:google, :parent)

  def project = Rails.application.credentials.dig(:google, :credentials, :project_id)

  def target_language_code = 'es'

  def translate_text = '¡Hola, mundo!'

  def translate_text_struct = Struct.new(:translated_text)

  def translations_struct = Struct.new(:translations)
end
