#this part goes in the deploy.rb file inside the config in your rails app



set :application, "voluntariando.me"

set :domain, "sucurilabs.net"
set :environment, "production"
set :branch, "master"
set :deploy_to, "/var/www/#{application}"

role :app, domain
role :web, domain
role :db, domain, :primary => true

default_run_options[:pty] = true

default_run_options[:shell] = 'bash'

default_environment["RAILS_ENV"] = 'production'

set :repository, "git@github.com:sucurilabs/voluntariando-me.git"
set :deploy_via, :remote_cache

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :scm_verbose, true
set :use_sudo, false
set :ssh_options, :forward_agent => true

set :user, "deployerbot"
set :keep_releases, 5

# set :default_environment, {
#     'PATH' => "/usr/local/rvm/gems/ruby-1.9.3-p194@global/gems/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@voluntariando-me/gems/bin:/usr/local/rvm/bin:$PATH",
#     'RUBY_VERSION' => 'ruby 1.9.3',
#     'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.3-p194',
#     'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.3-p194:/usr/local/rvm/gems/ruby-1.9.3-p194@global',
#     'BUNDLE_PATH' => '/usr/local/rvm/gems/ruby-1.9.3-p194/gems/bunlder-1.1.4' # If using bundler.
# }
# set :bundle_gemfile,      "Gemfile"
#   set :bundle_dir,          fetch(:shared_path)+"/bundle"
#   set :bundle_flags,        "--deployment --quiet"
#   set :bundle_without,      [:development, :test]


namespace :deploy do
  desc "restarting"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "seeding db"
  task :seed do
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=production"
  end
  # desc "symlink vendor to shared vendor"
  # task :symlink_vendor_to_shared_vendor do
  #   run "ln -s #{current_path}/../shared/vendor #{current_path}/vendor"
  # end

  desc "trust rvmrc"
  task :trust_rvmrc do
    run "/usr/local/rvm/bin/rvm rvmrc trust #{release_path}"
  end
  # task :migrate do
  #   run "ruby -v"
  # end
end

task :ruby_version, :roles => :app do
  run "ruby -v"
  run "source /etc/profile; rvm list"
  run "rvm list"
end

# namespace :bundle do
#   task :install do
#     run "export GEM_HOME=/usr/local/rvm/gems/ruby-1.9.3-p194 && bundle install"
#   end
# end

before "deploy:assets:precompile", "bundle:install"
after 'deploy:symlink', 'deploy:symlink_vendor_to_shared_vendor'
after :deploy, 'deploy:trust_rvmrc'
