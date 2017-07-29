
Run in local production (config prod database and RAILS_ENV=production rails db:migrate)

Specific to Helloworld tuto
in config/environments/production.rb

  config.action_mailer.perform_caching = false
  config.cache_store = :file_store, "tmp/cache"


`app/policies/application_policy.rb`


Suppose: A VPS with rbenv, ruby 2.4.0, rails 5.1.2, git and NGINX with passenger

Gem capistrano
Capistrano config 
Capistrano deploy
Secrets.yml database.yml





