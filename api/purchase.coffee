'use strict'

Hope = require('zenserver').Hope
Purchase = require '../common/models/purchase'

module.exports = (zen) ->

  zen.get '/api/purchase', (request, response) ->
    response.json hello: 'world'

  zen.post '/api/purchase', (request, response) ->
    response.json hello: 'world'

  zen.put '/api/purchase', (request, response) ->
    response.json hello: 'world'

  zen.delete '/api/purchase', (request, response) ->
    response.json hello: 'world'
