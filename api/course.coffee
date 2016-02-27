'use strict'

Hope = require('zenserver').Hope
Course = require '../common/models/course'
Session = require '../common/session'

module.exports = (zen) ->

  zen.get '/api/course', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      limit = 0
      filter = user: session._id
      if request.parameters.id?
        filter._id = request.parameters.id
        limit = 1
      Course.search filter, limit
    ]).then (error, value) ->
      return response.unauthorized() if error
      if request.parameters.id
        result = value.parse()
      else
        result = courses: (course.parse() for course in value) or []
      response.json result

  zen.post '/api/course', (request, response) ->
    if request.required ['title']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        values = request.parameters
        values.user = session._id
        Course.create values
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.put '/api/course', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Course.findAndUpdate filter, request.parameters
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/course', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Course.search filter, limit = 1
      , (error, course) ->
        course.delete()
      ]).then (error, value)->
        if error then response.unauthorized() else response.ok()
