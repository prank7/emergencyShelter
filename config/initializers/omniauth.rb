OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,"876835277274-s6149p4p60hlrelhmci62dan4gmqdl6s.apps.googleusercontent.com", "FGS8TgtkLjAO4oLzXPGNVBSU"
end