source 'https://rubygems.org'

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.3'
# Use Devise for authentication
gem 'devise'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Compass
gem 'compass-rails'
# Use Susy for grid
gem "singularitygs", "~> 1.1.2"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# use HTTParty to access api
gem 'httparty'

group :development do
  gem 'sqlite3'
  gem 'guard', '>= 2.2.2',       :require => false
  gem 'guard-minitest'
  gem 'guard-livereload',        :require => false
  gem 'rack-livereload'
  gem 'rb-fsevent',              :require => false
  gem 'spring'
  gem 'terminal-notifier-guard'

  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
end

group :production do
  gem 'rails_12factor'
  gem 'mysql2', '~> 0.3.18'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]
