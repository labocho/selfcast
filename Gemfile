source "https://rubygems.org"
ruby "2.5.1"

gem "rails", "~> 5.2.0"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "pg", "< 1.0.0"

# Gems used only for assets and not required
# in production environments by default.
gem "coffee-rails"
gem "sass-rails"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem "therubyracer", platforms: :ruby

gem "uglifier"

gem "jquery-rails"

gem "less-rails"
gem "twitter-bootstrap-rails", git: "https://github.com/seyhunak/twitter-bootstrap-rails.git", branch: "bootstrap3"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "haml"
gem "kaminari"
gem "rails-i18n"

group :development do
  gem "rubocop"
  gem "spring"
  gem "web-console", "~> 2.0"
end

group :development, :test do
  gem "byebug"
  gem "capybara-webkit", "~> 1.15.1"
  gem "ci_reporter"
  gem "database_cleaner"
  gem "dotenv-rails"
  gem "launchy"
  gem "machinist"
  gem "rails-controller-testing"
  gem "rspec-activemodel-mocks" # to use stub_model
  gem "rspec-rails"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "turnip"
end

gem "carrierwave"
gem "devise"
gem "fog-aws"
gem "mail-iso-2022-jp"
gem "thin"
# gem "action_mailer_config", :git => "git://github.com/labocho/action_mailer_config.git"
gem "bootsnap"
gem "exception_notification", "~> 2.6.1"
gem "lograge"
gem "mediaelement_rails"
gem "rails_serve_static_assets", group: :production
