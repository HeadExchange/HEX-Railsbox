# config valid for current version and patch releases of Capistrano
lock "~> 3.18.1"

set :rbenv_type, :user
set :rbenv_ruby, "3.2.4"

set :application, "YOUR_APP_NAME"
set :repo_url, "git@github.com:USERNAME/REPONAME.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :branch, "main"
set :rails_env, "production"
set :bundle_flags, "--deployment"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/apps/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key", "config/puma.rb", "config/credentials.yml.enc", "public/sitemap.xml.gz"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/uploads", "public/autoupload", "vendor/javascript", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :puma_systemctl_user, :system
set :puma_init_active_record, true
set :puma_enable_socket_service, true
set :puma_conf, -> { File.join(shared_path, 'config', 'puma.rb') }

set :sitemap_roles, :web
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :ssh_options, verify_host_key: :never
