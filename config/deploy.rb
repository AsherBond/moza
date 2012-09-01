require "bundler/capistrano"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/check"
load "deploy/assets"

server "184.72.41.252", :web, :app, :db, primary: true

set :user, "ubuntu"
set :application, "moza"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:hellocodes/#{application}.git"
set :branch, "master"

set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "devmoz.pem")]

after "deploy", "deploy:cleanup" # keep only the last 5 releases

# To setup new Ubuntu 12.04 server:
# ssh root@xxxxxxxxxx
# adduser deployer
# echo "deployer ALL=(ALL:ALL) ALL" >> /etc/sudoers
# exit
# ssh-copy-id deployer@xxxxxxxxxx
# cap deploy:install
# cap deploy:setup
# cap deploy:cold
