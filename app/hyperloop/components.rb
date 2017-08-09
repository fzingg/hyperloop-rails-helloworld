require 'opal'

require 'react/react-source-browser'
require 'react/react-source-server'

require 'hyper-component'

if React::IsomorphicHelpers.on_opal_client?
  require 'opal-jquery'
  require 'browser'
  require 'browser/interval'
  require 'browser/delay'
end

require 'hyper-model'
require 'hyper-store'
require 'hyper-operation'
require 'hyper-router/react-router-source'
require 'hyper-router'

# require 'opal_hot_reloader'
# #
# OpalHotReloader.listen(25222, true)

require_tree './models' if RUBY_ENGINE == 'opal'
require_tree './operations'
require_tree './stores'
require_tree './components'
