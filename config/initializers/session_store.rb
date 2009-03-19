# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_movies.stevenwilkin.com_session',
  :secret      => '9710e4e0ff842908ab619bb3c8e74362c467671f6220063d207c58511dc76d2397969236c6b89af2a40906da0c2b9aecf76ce4520520a3e1b0e558501516af07'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
