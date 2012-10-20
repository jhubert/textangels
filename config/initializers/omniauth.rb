# Make sure that the facebook settings have been loaded already
require_relative './configuration' unless defined?(FACEBOOK_APP_ID)

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET
end
