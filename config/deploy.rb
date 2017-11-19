# config valid only for current version of Capistrano
lock "3.10.0"

set :application, "hyperloop-rails-newhelloworld"
set :repo_url, "ssh://git@pixagency.cloudcraft.fr/home/git/hyperloop-rails-newhelloworld"

set :user, "fcooker"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system backup}

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

namespace :bundle do
  task :clean do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :clean
        end
      end
    end
  end
end

after "deploy:cleanup", "bundle:clean"
