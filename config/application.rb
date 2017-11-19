require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HyperloopRailsNewhelloword
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    #config.assets.paths << ::Rails.root.join('public', 'packs').to_s


    ##########################################
    #Hyperloop config for advanced configuration
    ##########################################

    # config.hyperloop.auto_config = false
    # config.eager_load_paths -= %W[#{config.root}/app/hyperloop]
    # #config.eager_load_paths += %W[#{config.root}/app/hyperloop/models]
    # config.eager_load_paths += %W[#{config.root}/app/hyperloop/operations]

    # ###########################################
    # # Hyperloop config for production mode
    # ###########################################

    # config.autoload_paths   -= %W[#{config.root}/app/hyperloop]

    # config.eager_load_paths += %W[#{config.root}/app/hyperloop/models]
    # config.autoload_paths += %W[#{config.root}/app/hyperloop/models]
    

  end
end
