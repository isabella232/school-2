# lock '3.1.0'

set :application, 'school'
set :repo_url, "git@github.com:macrocoders/#{fetch(:application)}.git"

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/opt/rails/#{fetch(:application)}"
set :scm, :git
set :ssh_options, forward_agent: true
set :rails_env, 'production'

#set :user, "root"
#set :use_sudo, false
#set :script_dir, "/home/#{fetch(:user)}/script"

set :deploy_via, :remote_cache

set :linked_files, %w(config/database.yml config/secrets.yml)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads public/system)

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

# ----- RBENV ----------
set :rbenv_type, :user
set :rbenv_ruby, '2.2.3'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_roles, :all

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles(:app) do
      execute "cd #{current_path} && #{fetch(:rbenv_prefix)} bundle exec foreman export initscript /etc/init.d " +
      "-f ./Procfile.production -a #{fetch(:application)} -u #{fetch(:user)} -l #{shared_path}/log"
      execute "chmod 755 /etc/init.d/#{fetch(:application)}"
    end
  end

  desc 'Start the application services'
  task :start do
    on roles(:app) do
      execute "bash /etc/init.d/#{fetch(:application)} start"
    end
  end

  desc 'Stop the application services'
  task :stop do
    on roles(:app) do
      execute "bash /etc/init.d/#{fetch(:application)} stop"
    end
  end

  desc 'Restart the application services'
  task :restart do
    on roles(:app) do
      execute "bash /etc/init.d/#{fetch(:application)} stop; bash /etc/init.d/#{fetch(:application)} start"
    end
  end

  desc 'Display logs for a certain process - arg example: PROCESS=web-1'
  task :logs do
    on roles(:app) do
      execute "cd #{current_path}/log && cat #{ENV['PROCESS']}.log"
    end
  end
end

# deploy with foreman#
#
namespace :deploy do
  after :publishing, 'foreman:export'
  after :publishing, :restart
  after :finishing, 'deploy:cleanup'

  desc 'Zero-downtime restart of Unicorn'
  task :restart do
    invoke 'foreman:restart'
  end

  desc 'Start unicorn'
  task :start do
    invoke 'foreman:start'
  end

  desc 'Stop unicorn'
  task :stop do
    invoke 'foreman:stop'
  end
end
