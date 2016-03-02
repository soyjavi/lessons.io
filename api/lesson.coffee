'use strict'

Hope = require('zenserver').Hope

Course = require '../common/models/course'
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
        Session request, response, redirect = false, admin = true
      , (error, @session) =>
        Course.search _id: request.parameters.course, limit = 1
      , (error, @course) =>
        values = request.parameters
        values.user = @session._id
        values.course = @course.id
        Lesson.create values
      , (error, @lesson) =>
        @course.lessons.addToSet @lesson.id
        @course.update()
      ]).then (error, @course) =>
        if error then response.unauthorized() else response.json @lesson.parse()

  zen.put '/api/lesson', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, redirect = false, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Lesson.findAndUpdate filter, request.parameters
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/lesson', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, redirect = false, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id, user: session._id
        Lesson.search filter, limit = 1
      , (error, @lesson) =>
        @lesson.delete()
      , (error, value) =>
        Course.search _id: @lesson.course, limit = 1
      , (error, @course) =>
        index = @course.lessons.indexOf @lesson.id
        @course.lessons.splice index, 1 if index > -1
        @course.update()
      ]).then (error, value) ->
        if error then response.unauthorized() else response.ok()
