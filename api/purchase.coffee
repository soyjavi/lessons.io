'use strict'

Hope = require('zenserver').Hope
Purchase = require '../common/models/purchase'
Session = require '../common/session'
C = require '../common/constants'
# mailer = require '../common/mailer'

module.exports = (zen) ->

  zen.get '/api/purchase', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      filter = user: session._id
      Purchase.search filter
    ]).then (error, value) ->
      return response.unauthorized() if error
      response.json purchases: (purchase.parse() for purchase in value) or []

  zen.post '/api/purchase', (request, response) ->
    Hope.shield([ ->
      Session request, response
    , (error, session) ->
      values = request.parameters
      values.user = session._id
      values.state = C.PURCHASE.STATE.UNPAID
      Purchase.create values
    ]).then (error, value) ->
      if error then response.unauthorized() else response.json value.parse()

  zen.put '/api/purchase', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id
        Purchase.findAndUpdate filter, request.parameters
      ]).then (error, value) ->
        if error then response.unauthorized() else response.json value.parse()

  zen.delete '/api/purchase', (request, response) ->
    if request.required ['id']
      Hope.shield([ ->
        Session request, response, null, admin = true
      , (error, session) ->
        filter = _id: request.parameters.id
        Purchase.search filter, limit = 1
      , (error, purchase) ->
        purchase.delete()
      ]).then (error, value)->
        if error then response.unauthorized() else response.ok()
