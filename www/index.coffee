'use strict'

# -- ISOMORPHIC
# ReactDOM = require 'react-dom/server'
# Subscribe = require('../app/layouts/subscribe').default
# -- /ISOMORPHIC

module.exports = (zen) ->

  zen.get '/', (request, response, next) ->
    bindings =
      page: 'subscribe'
      # -- ISOMORPHIC
      # markup: ReactDOM.renderToString Subscribe(caption: 'Hello World')
      # -- /ISOMORPHIC
      title: 'lessons.io'
      example:
        subdomain: request.parameters.subdomain
      session: request.session
      mobile: request.mobile
      ip: request.ip
    response.page 'index', bindings, ['partial.example', 'partial.session']
