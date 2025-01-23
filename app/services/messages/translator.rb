# frozen_string_literal: true

module Messages
  class Translator < ApplicationService
    def initialize(text, target_language)
      raise ArgumentError, 'Text and target language cannot be nil or empty' if text.blank? || target_language.blank?

      @text = text
      @target_language = target_language
    end

    def call
      response = translate.translate_text(contents: [@text], target_language_code:, parent:, mime_type:)
      translated_text = response&.translations&.first
      translated_text&.translated_text
    end

    private

    def mime_type = @mime_type ||= Rails.application.credentials.dig(:google, :mime_type)

    def parent = @parent ||= Rails.application.credentials.dig(:google, :parent)

    def project = @project ||= Rails.application.credentials.dig(:google, :credentials, :project_id)

    def target_language_code = @target_language

    def translate = @translate ||= Google::Cloud::Translate.translation_service
  end
end
