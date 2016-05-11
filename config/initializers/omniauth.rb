Rails.application.config.middleware.use OmniAuth::Builder do
  facebook = Rails.configuration.x.facebook
  google = Rails.configuration.x.google

  provider :facebook, facebook['client_id'], facebook['client_secret'],
    :scope => 'email,public_profile,user_birthday'

  provider :google_oauth2, google['client_id'], google['client_secret'], :scope => 'userinfo.email'
end
