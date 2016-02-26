'use strict'

Hope = require('zenserver').Hope
Comment = require '../common/models/comment'
Session = require '../common/session'

module.exports = (zen) ->

  zen.get '/api/comment', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      Comment.search request.parameters
    ]).then (error, value) ->
      return response.unauthorized() if error
      if request.parameters.id
        result = value.parse()
      else
        result = courses: (comment.parse() for comment in value) or []
      response.json result

  zen.post '/api/comment', (request, response) ->
    if request.required ['text']
      Hope.shield([ ->
        Session request, response, null
      , (error, session) ->
        values = request.parameters
        values.user = session._id
        Comment.create values
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/comment', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id
        Comment.search filter, limit = 1
      , (error, comment) ->
        comment.delete()
      ]).then (error, value)->
        if error then response.unauthorized() else response.ok()
