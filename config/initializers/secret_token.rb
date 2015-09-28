# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
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

Tutorial::Application.config.secret_token = '9ea38f15ead67ab2e6d0aa90125b87f4b25b79b37651ee47e6f16a3e55e76ae83687fda65cc1e0955acb303c7dbbf9769182487304c88eb8498c7dd062d5b6e9'
