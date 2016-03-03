'use strict'

C = require '../common/constants'
# -- ISOMORPHIC
# ReactDOM = require 'react-dom/server'
# Subscribe = require('../app/layouts/subscribe').default
# -- /ISOMORPHIC

module.exports = (zen) ->

  zen.get '/', (request, response, next) ->
    # -- ISOMORPHIC
    # markup = ReactDOM.renderToString Subscribe(caption: 'Hello World')
    # -- /ISOMORPHIC
    bindings =
      page: 'subscribe'
      title: C.PAGE.TITLE
      example:
        subdomain: request.parameters.subdomain
      session: request.session
      mobile: request.mobile
      ip: request.ip
    response.page 'index', bindings, ['partial.example', 'partial.session']

  zen.get '/:page', (request, response, next) ->
    if request.parameters.page in ['join']
      bindings =
        page: request.parameters.page
        title: C.PAGE.TITLE
      response.page 'index', bindings
    else
      response.redirect '/'
