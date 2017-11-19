module Hyperloop
  module AutoCreate
    def needs_init?
      true
    end
  end
end

        
Hyperloop.configuration do |config|
  # config.cancel_import('hyper-router/react-router-source')
  config.compress_system_assets = false
  config.prerendering = :off
  #config.import 'reactrb/auto-import'
  config.transport = :simple_poller
  config.import Webpacker.manifest.lookup("client_and_server.js").split("/").last
  config.import Webpacker.manifest.lookup("application.js").split("/").last
  # config.channel_prefix = "Hyperloop"
  # config.opts = {
  #   app_id: '376259',
  #   key: 'bd7704d4f66e46ef896f',
  #   secret: '871f3d39cf9b399f0b34',
  #   cluster: 'eu',
  #   encrypted: true
  # }
  
end

