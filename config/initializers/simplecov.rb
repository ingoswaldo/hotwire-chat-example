# frozen_string_literal: true

if Rails.env.test?
  require 'simplecov'

  SimpleCov.start 'rails' do
    add_group 'Services', 'app/services'
    add_filter %w[app/channels app/components app/helpers app/jobs app/mailers]
  end
end
