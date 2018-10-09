source 'https://rubygems.org'
ruby "2.5.1"

gem 'rails', '~> 5.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '< 1.0.0'


# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', :platforms => :ruby

gem 'uglifier'

gem 'jquery-rails'

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
  gem "spring"
  gem "web-console", "~> 2.0"
end

group :development, :test do
  gem 'dotenv-rails'
  gem "byebug"
  gem "rspec-rails"
  gem "rspec-activemodel-mocks" # to use stub_model
  gem "rails-controller-testing"
  gem "machinist"
  gem "turnip"
  gem "capybara-webkit", "~> 1.15.1"
  gem "launchy"
  gem "database_cleaner"
  gem "ci_reporter"
  gem "simplecov", :require => false
  gem "simplecov-rcov", :require => false
end

gem "thin"
gem "devise"
gem "fog"
gem "carrierwave"
gem "aws-sdk"
gem "mail-iso-2022-jp"
# gem "action_mailer_config", :git => "git://github.com/labocho/action_mailer_config.git"
gem "exception_notification", "~> 2.6.1"
gem "mediaelement_rails"
gem "lograge"
gem "rails_serve_static_assets", group: :production
