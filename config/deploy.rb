#require "rvm/capistrano"
#require 'bundler/capistrano'
#set :application, "Advent Calendar"
#ssh_options[:verbose] = :debug 


#set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
#set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

#before 'deploy:setup', 'rvm:install_rvm'  # install/update RVM
#before 'deploy:setup', 'rvm:install_ruby' # install Ruby and create gemset, OR:



#NOTE: This file is not working! something is wrong with ssh
set :user, 'ec2-user'
ssh_options[:forward_agent] = true
ssh_options[:keys] = %w('~/.ssh/disco.pem')
default_run_options[:pty] = true

set :domain, 'adventcalendar.dyndns.org'
#set :domain, 'ec2-107-22-251-232.compute-1.amazonaws.com'
set :applicationdir, "/home/ec2-user/apps"

set :scm, 'git'
set :repository,  "ssh://ec2-user@adventcalendar.dyndns.org/home/ec2-user/apps/advent.git"
#set :git_enable_submodules, 1 # if you have vendored rails
set :branch, 'master'
set :scm_verbose, true

# roles (servers)
role :web, domain
role :app, domain
role :db,  domain, :primary => true


# deploy config
set :deploy_to, applicationdir
set :deploy_via, :remote_cache
#set :deploy_via, :copy

# additional settings
#default_run_options[:pty] = true  # Forgo errors when deploying from windows
 
# Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
