'use strict'

C = require '../common/constants'
# -- ISOMORPHIC
# ReactDOM = require 'react-dom/server'
# Unknown = require('../app/layouts/unknown').default
# -- /ISOMORPHIC

module.exports = (zen) ->

  zen.get '/', (request, response, next) ->
    # -- ISOMORPHIC
    # markup = ReactDOM.renderToString Unknown(caption: 'Hello World')
    # -- /ISOMORPHIC
    _page request, response

  zen.get '/:page', (request, response, next) ->
    if request.parameters.page in ['join', 'sign_in', 'series']
      _page request, response
    else
      response.redirect '/'

  zen.get '/series/:id', (request, response, next) ->
    _page request, response

_page = (request, response) ->
  bindings =
    page: request.parameters.page
    session: request.session
    title: C.PAGE.TITLE
  response.page 'index', bindings
