require "active_support/core_ext/integer/time"
Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :warn
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
  config.logger = ActiveSupport::Logger.new(Rails.root.join('log', 'production.log'))
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }
  config.active_record.dump_schema_after_migration = false
  # Action Mailer configuration
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:        'smtp.hostinger.com',
    port:           587,
    domain:         'tattle.diversepixel.com',
    user_name:      'hi@tattle.diversepixel.com',
    password:       Rails.application.credentials.dig(:email_setup, :password),
    authentication: 'plain',
    enable_starttls_auto: true,
    open_timeout:   5,
    read_timeout:   5
  }
  config.action_mailer.default_url_options = { host: 'tattle.diversepixel.com' }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = { from: 'hi@tattle.diversepixel.com' }
end
