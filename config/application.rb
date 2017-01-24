require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Systems
  class Application < Rails::Application
    config.action_mailer.delivery_method   = :postmark
    config.action_mailer.postmark_settings = { :api_token => ENV['POSTMARK_API_TOKEN'] }
  end
end
