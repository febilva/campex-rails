Rails.application.config.middleware.use OmniAuth::Builder do
  facebook = Rails.configuration.x.facebook

  provider :facebook, facebook['client_id'], facebook['client_secret'],
    :scope => 'email,public_profile,user_birthday'
end
