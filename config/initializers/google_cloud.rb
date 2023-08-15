# frozen_string_literal: true

Google::Cloud::Translate.configure do |config|
  config.credentials = Rails.application.credentials.google.credentials unless Rails.env.test?
end
