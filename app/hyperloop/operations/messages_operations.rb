module MessagesOperations

  class TestServerOp < Hyperloop::ServerOp
    param :acting_user, nils: true
    dispatch_to { Hyperloop::Application }

    step { Rails.logger.info " *************** DEBUG TestServerOp ********************** " }

  end

  class TestOp < Hyperloop::Operation
    step { alert(" *************** DEBUG TestOp ********************** ") }
  end

  class MessagesBase < Hyperloop::ServerOp
    param :acting_user, nils: true
    dispatch_to { Hyperloop::Application }

    def cachedmessages
      Rails.logger.info "*************************************"
      Rails.logger.info "DEBUG 3: FETCHING RAILS.CACHE"
      Rails.cache.fetch('messages') { [] }
    end

  end
  
  class GetMessages < MessagesBase
    outbound :messages

    step do
       Rails.logger.info "*************************************"
       Rails.logger.info "DEBUG 2: ASSIGNING params.messages with RAILS.CACHE"
       params.messages = cachedmessages 
       Rails.logger.info "*************************************"
       Rails.logger.info "DEBUG 4: params.messages: #{params.messages}"
    end
  end

  class Send < MessagesBase
    param :message


    step do
      
      
      params.message = {
        message: params.message
      }
      #newcachedmessages = cachedmessages << params.message
      #Rails.logger.info "*************************************"
      #Rails.logger.info "DEBUG 5: newcachedmessages #{newcachedmessages}"
      #Rails.cache.write('messages', newcachedmessages)
    end
  end


end
