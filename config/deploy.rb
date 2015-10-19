lock '3.4.0'

set :application, 'backpack'
set :user, 'backend'
set :repo_url, 'git@github.com:frootloops/backpack-backend.git'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :linked_files, %w(config/database.yml config/secrets.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)
set :stages, %w(production)
set :default_stage, "production"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
