# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["sendgrid_id_key"],
  :password => ENV["sendgrid_api_key"], # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'darknet2.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}