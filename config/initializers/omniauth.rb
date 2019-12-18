Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "987216769951-455dgc21hc2o412j8cm86osmjd5p00ue.apps.googleusercontent.com", "AVwb7uaklJaYTSb_xbJRCA9P"
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
end
