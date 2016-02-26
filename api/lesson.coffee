'use strict'

Hope = require('zenserver').Hope
Lesson = require '../common/models/lesson'
Session = require '../common/session'

module.exports = (zen) ->

  zen.get '/api/lesson', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      limit = 0
      filter = user: session._id
      if request.parameters.id?
        filter._id = request.parameters.id
        limit = 1
      Lesson.search filter, limit
    ]).then (error, value) ->
      return response.unauthorized() if error
      if request.parameters.id
        result = value.parse()
      else
        result = courses: (lesson.parse() for lesson in value) or []
      response.json result

  zen.post '/api/lesson', (request, response) ->
    if request.required ['course', 'title']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        values = request.parameters
        values.user = session._id
        Lesson.create values
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.put '/api/lesson', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Lesson.findAndUpdate filter, request.parameters
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/lesson', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Lesson.search filter, limit = 1
      , (error, lesson) ->
        lesson.delete()
      ]).then (error, value)->
        if error then response.unauthorized() else response.ok()
