# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1', '>= 7.1.5.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Devise to authentication flow
gem 'devise', '~> 4.9', '>= 4.9.2'

# User Responders to improve devise and Hotwire / Turbo integration
gem 'responders', '~> 3.1'

# Use Tailwind for front-end layout
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.28'

# Use View Component to creating reusable, testable & encapsulated view components
gem 'view_component', '~> 3.0'

# Use Inline SVG for render svg as html tag
gem 'inline_svg', '~> 1.9'

# Use Initial for user avatar
gem 'initials', '~> 0.4.3'

# Use Google Translator Advanced library
gem 'google-cloud-translate', '~> 3.4.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Use Rubocop to lint the code
  gem 'rubocop', '~> 1.50', '>= 1.50.2'
  gem 'rubocop-rails', '~> 2.19', '>= 2.19.1'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
end

group :test do
  gem 'simplecov', '~> 0.22.0'
end
