'use strict'

Hope = require('zenserver').Hope
Lesson = require '../common/models/lesson'

module.exports = (zen) ->

  zen.get '/api/lesson', (request, response) ->
    response.json hello: 'world'

  zen.post '/api/lesson', (request, response) ->
    response.json hello: 'world'

  zen.put '/api/lesson', (request, response) ->
    response.json hello: 'world'

  zen.delete '/api/lesson', (request, response) ->
    response.json hello: 'world'
