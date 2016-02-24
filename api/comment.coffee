'use strict'

Hope = require('zenserver').Hope
Comment = require '../common/models/comment'

module.exports = (zen) ->

  zen.get '/api/comment', (request, response) ->
    response.json hello: 'world'

  zen.post '/api/comment', (request, response) ->
    response.json hello: 'world'

  zen.put '/api/comment', (request, response) ->
    response.json hello: 'world'

  zen.delete '/api/comment', (request, response) ->
    response.json hello: 'world'
