require 'bundler/capistrano'
set :application, "Advent Calendar"
set :user, 'ec2-user'
set :domain, 'adventcalendar.dyndns.org'
set :applicationdir, "/home/ec2-user/apps"

set :scm, 'git'
set :repository,  "ssh://ec2-user@adventcalendar.dyndns.org/home/ec2-user/apps/advent.git"
set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true


# deploy config
set :deploy_to, applicationdir
set :deploy_via, :export

# additional settings
default_run_options[:pty] = true  # Forgo errors when deploying from windows
 
# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
