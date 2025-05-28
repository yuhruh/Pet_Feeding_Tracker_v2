# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV['GOOGLE_CLIENT_ID'],
           ENV['GOOGLE_CLIENT_SECRET'],
           {
             scope: 'email,profile', # Request access to email and profile information
             prompt: 'select_account', # Prompts user to select an account if multiple are logged in
             image_aspect_ratio: 'square', # Request square profile image
             image_size: 50, # Request specific image size
             redirect_uri: "#{Rails.env.production? ? 'https://your-production-app-url.com' : 'http://localhost:3000'}/auth/google_oauth2/callback"
           }
end