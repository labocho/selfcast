require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Selfcast
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :haml
      g.test_framework :rspec
      g.helper false
      g.stylesheets false
      g.javascripts false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Tokyo'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Json.new
    config.lograge.custom_options = -> (event) {
      params = event.payload[:params].reject do |k|
        ['controller', 'action'].include? k
      end

      params = filter_uploaded_file(params)

      { "session_id" => event.payload[:session_id],
        "remote_ip" => event.payload[:remote_ip],
        "user_agent" => event.payload[:user_agent],
        "user_id" => event.payload[:user_id],
        "params" => params,
        "time" => event.time.to_i,
      }
    }

    # アップロードされたファイルの内容をログに出力しないようにする
    def filter_uploaded_file(obj)
      case obj
      when Array
        obj.map{|e| filter_uploaded_file(e) }
      when Hash
        obj.inject({}) do |hash, (k, v)|
          hash[k] = filter_uploaded_file(v)
          hash
        end
      when ActionDispatch::Http::UploadedFile
        obj.inspect
      else
        obj
      end
    end
  end
end
