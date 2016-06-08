# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'world-cup-draft'
set :repo_url, 'git@github.com:tylermarien/world-cup-draft.git'
set :deploy_to, '/data'
set :log_level, :info

# namespace :deploy do
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end
