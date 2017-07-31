
VPS:
https://gorails.com/deploy/ubuntu/16.04

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




HEROKU:
https://devcenter.heroku.com/articles/getting-started-with-rails5

heroku login
heroku create
heroku addons:create heroku-postgresql
heroku addons:add pusher

#config/database.yml


production:
  adapter: postgresql
  encoding: unicode
  database: hyperloop-showcase-template-heroku_production
  username: hyperloop-showcase-template-heroku
  password: <%= ENV['HYPERLOOP-SHOWCASE-TEMPLATE-HEROKU_DATABASE_PASSWORD'] %>


#Gemfile

  ruby '2.3.1'

bundle update

#Procfile

web: bundle exec puma -C config/puma.rb

git add .
git commit - m "init"
git push heroku master

heroku run rake db:migrate



