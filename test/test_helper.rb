# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'minitest/autorun'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def mock_google_translator_service(text, target_code, response)
      translated_text = nil
      mock_google_translation_service = Minitest::Mock.new
      mock_google_translation_service.expect(:translate_text, response, **translate_text_args)

      google_translate_service_class.stub(:translation_service, mock_google_translation_service) do
        translated_text = translate_service_class.call(text, target_code)
      end

      translated_text
    end

    private

    def google_translate_service_class = Google::Cloud::Translate

    def mime_type = Rails.application.credentials.dig(:google, :mime_type)

    def translate_service_class = ::Messages::Translator

    def translate_text_args = { contents:, target_language_code:, parent:, mime_type: }
  end
end
