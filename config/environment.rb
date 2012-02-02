# Load the rails application
require File.expand_path('../application', __FILE__)

LetMeIn.configure do |conf|
  conf.model      = 'User'
  conf.attribute = 'username'
  conf.password   = 'password_hash'
  conf.salt       = 'password_salt'
end

# Initialize the rails application
Warecal::Application.initialize!
