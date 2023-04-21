# frozen_string_literal: true

# Assuming you have not yet modified this file, each configuration option below
# is set to its default value. Note that some are commented out while others
# are not: uncommented lines are intended to protect your configuration from
# breaking changes in upgrades (i.e., in the event that future versions of
# Devise change the default values for those options).
#
# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = 'devise@example.com'

  # ==> ORM configuration
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 12

  # ==> Configuration for :confirmable
  config.reconfirmable = true

  # ==> Configuration for :rememberable
  config.expire_all_remember_me_on_sign_out = true

  # ==> Configuration for :validatable
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :recoverable
  config.reset_password_within = 6.hours

  # ==> Navigation configuration
  config.sign_out_via = :delete

  # ==> Hotwire/Turbo configuration
  config.responder.error_status = :unprocessable_entity
  config.responder.redirect_status = :see_other
end
