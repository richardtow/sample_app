# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '4fcf1e379f38a20445470d6a4020f42577928b298d87d0a3d85c8948d52c68cab26be56ea91577cabd7da4f04dc6dc83ea299225cff0ad8e4139e6597fe084d9'

require 'securerandom'

def secure_token
   token_file = Rails.root.join('.secret')
   if File.exist?(token_file)
      # Use the existing token.
      File.read(token_file).chomp
   else
      # Generate a new token and store it in token_file.
      token = SecureRandom.hex(64)
      File.write(token_file, token)
      token
   end
end

SampleApp::Application.config.secret_key_base = secure_token
