require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :facebook, ENV["FB_CLIENT_ID"], ENV["FB_CLIENT_SECRET"]
end