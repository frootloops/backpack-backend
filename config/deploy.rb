lock '3.4.0'

set :application, 'backpack'
set :repo_url, 'git@github.com:frootloops/backpack-backend.git'
set :deploy_to, '/home/backend/backpack'
set :linked_files, %w(config/database.yml config/secrets.yml config/puma.rb)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)
set :stages, %w(production)
set :default_stage, "production"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
