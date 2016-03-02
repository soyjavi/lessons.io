'use strict'

Hope = require('zenserver').Hope
Subscription = require '../common/models/subscription'
Session = require '../common/session'
C = require '../common/constants'
# mailer = require '../common/mailer'

module.exports = (zen) ->

  zen.get '/api/subscription', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      filter = user: session._id
      Subscription.search filter
    ]).then (error, value) ->
      return response.unauthorized() if error
      response.json subscriptions: (subscription.parse() for subscription in value) or []

  zen.post '/api/subscription', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      values = request.parameters
      values.user = session._id
      values.state = C.SUBSCRIPTION.STATE.UNPAID
      Subscription.create values
    ]).then (error, value) ->
      if error then response.unauthorized() else response.json value.parse()

  zen.put '/api/subscription', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id
        Subscription.findAndUpdate filter, request.parameters
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/subscription', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id
        Subscription.search filter, limit = 1
      , (error, subscription) ->
        subscription.delete()
      ]).then (error, value) ->
        if error then response.unauthorized() else response.ok()
