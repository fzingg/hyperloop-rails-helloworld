
Run in local production (config prod database and RAILS_ENV=production rails db:migrate)

Advice: not sqlite in prod

Specific to Helloworld tuto
in config/environments/production.rb

  config.action_controller.perform_caching = true
  config.cache_store = :file_store, "tmp/cache"


`app/policies/application_policy.rb`


Suppose: A VPS with rbenv, ruby 2.4.0, rails 5.1.2, git and NGINX with passenger

gem 'capistrano'
gem 'capistrano-bundler'
gem 'capistrano-rails'
gem 'capistrano-rbenv', github: "capistrano/rbenv"

bundle install

bundle exec cap install STAGES=production


Capistrano config 

Bundle exec cap production deploy

scp config/secrets.yml fcooker@pixagency.com:/home/fcooker/apps/testapp/shared/config/
scp config/database.yml fcooker@pixagency.com:/home/fcooker/apps/testapp/shared/config/

sudo -u postgres psql
CREATE DATABASE testapp owner fcooker;

Bundle exec cap production deploy



