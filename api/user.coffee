'use strict'

Hope = require('zenserver').Hope
User = require '../common/models/user'

module.exports = (zen) ->

  zen.post '/api/signup', (request, response) ->
    response.json hello: 'world'

  zen.post '/api/signin', (request, response) ->
    response.json hello: 'world'

  zen.get '/api/profile', (request, response) ->
    response.json hello: 'world'

  zen.put '/api/profile', (request, response) ->
    response.json hello: 'world'

  zen.delete '/api/profile', (request, response) ->
    response.json hello: 'world'
