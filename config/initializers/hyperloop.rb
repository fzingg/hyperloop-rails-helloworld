module Hyperloop
  module AutoCreate
    def needs_init?
      true
    end
  end
end

        
Hyperloop.configuration do |config|
  config.transport = :simple_poller
  # config.channel_prefix = "Hyperloop"
  # config.opts = {
  #   app_id: '376259',
  #   key: 'bd7704d4f66e46ef896f',
  #   secret: '871f3d39cf9b399f0b34',
  #   cluster: 'eu',
  #   encrypted: true
  # }
  
end

