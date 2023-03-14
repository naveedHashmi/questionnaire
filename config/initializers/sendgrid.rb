require 'sendgrid-ruby'

SendGrid::API_KEY = ENV['SENDGRID_API_KEY']

ActionMailer::Base.smtp_settings = {
  :address => ENV['SMTP_SERVER_ADDRESS'],
  :port => '587',
  :authentication => :plain,
  :user_name => 'apikey',
  :password => ENV['SENDGRID_API_KEY'],
  :domain => ENV['SMTP_DOMAIN'],
  :enable_starttls_auto => true
}
