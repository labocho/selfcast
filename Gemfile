source "https://rubygems.org"
ruby "2.5.1"

# Core
# ----------------------------------------
gem "rails", "~> 5.2.0"

# Database
# ----------------------------------------
gem "pg", "< 1.0.0"

# Deploy
# ----------------------------------------
gem "bootsnap"
gem "thin"

# Auth
# ----------------------------------------
gem "devise"

# Assets
# ----------------------------------------
gem "coffee-rails"
gem "jquery-rails"
gem "less-rails"
gem "mediaelement_rails"
gem "rails_serve_static_assets", group: :production
gem "sass-rails"
gem "therubyracer", platforms: :ruby
gem "twitter-bootstrap-rails", git: "https://github.com/seyhunak/twitter-bootstrap-rails.git", branch: "bootstrap3"
gem "uglifier"

# Views
# ----------------------------------------
gem "haml"
gem "kaminari"
gem "rails-i18n"

# Model
# ----------------------------------------
gem "carrierwave"
gem "fog-aws"

# Debug
# ----------------------------------------
gem "exception_notification", "~> 2.6.1"
gem "bugsnag", "~> 6.8"
gem "lograge"

group :development do
  gem "rubocop"
  gem "spring"
  gem "web-console", "~> 2.0"
  gem "listen"
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
