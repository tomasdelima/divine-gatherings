Rails.application.routes.draw do
  get "/contacts/:importer/callback" => "users#import_facebook_contacts"
end
