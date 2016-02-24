'use strict'

Hope = require('zenserver').Hope
Course = require '../common/models/course'

module.exports = (zen) ->

  zen.get '/api/course', (request, response) ->
    response.json hello: 'world'

  zen.post '/api/course', (request, response) ->
    response.json hello: 'world'

  zen.put '/api/course', (request, response) ->
    response.json hello: 'world'

  zen.delete '/api/course', (request, response) ->
    response.json hello: 'world'
