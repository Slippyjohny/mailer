# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Mail.defaults do
  delivery_method :smtp, {
      :address => ENV['POSTMARK_SMTP_SERVER'],
      :port => '25', # or 2525
      :domain => 'mailersystem.heroku.com',
      :user_name => ENV['POSTMARK_API_TOKEN'],
      :password => ENV['POSTMARK_API_TOKEN'],
      :authentication => :cram_md5, # or :plain for plain-text authentication
      :enable_starttls_auto => true, # or false for unencrypted connection
  }
end

ActionMailer::Base.smtp_settings = {
    :port           => '25', # or 2525
    :address        => ENV['POSTMARK_SMTP_SERVER'],
    :user_name      => ENV['POSTMARK_API_TOKEN'],
    :password       => ENV['POSTMARK_API_TOKEN'],
    :domain         => 'mailersystem.heroku.com',
    :authentication => :cram_md5, # or :plain for plain-text authentication
    :enable_starttls_auto => true, # or false for unencrypted connection
}
ActionMailer::Base.delivery_method = :smtp


