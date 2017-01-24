# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :address => 'mailersystem.herokuapp.com',
    :port => 587,
    :user_name => "shpak.d.o@gmail.com",
    :password => "dmitro24",
    :authentication => :plain,
    :enable_starttls_auto => true,
    :openssl_verify_mode => 'none'
}
