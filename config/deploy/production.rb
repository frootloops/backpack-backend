server '46.101.166.85', user: 'backend', roles: %w{app db web}

set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :pty, true
set :use_sudo, false
set :stage, :production
set :deploy_via, :remote_cache
set :rbenv_ruby, '2.2.3'
