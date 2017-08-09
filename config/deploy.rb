# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "hyperloop-rails-newhelloworld"
set :repo_url, "ssh://git@pixagency.cloudcraft.fr/home/git/hyperloop-rails-newhelloworld"

set :user, "fcooker"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system backup}

set :keep_releases, 2

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end


  desc 'Truncates all *.log files in log/ to zero bytes'
  task :clear do
    on roles(:app), in: :sequence, wait: 5 do        
      execute :rake, 'log:clear'        
    end
  end

  after :finishing, 'deploy:cleanup'
  after :deploy, "deploy:restart"

end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5
