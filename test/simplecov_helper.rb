# frozen_string_literal: true

require 'simplecov'

SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
  add_filter %w[app/channels app/models/application_record.rb app/components app/helpers app/jobs app/mailers]
end
