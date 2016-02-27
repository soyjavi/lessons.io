'use strict'

stripe = require 'stripe'
Hope = require('zenserver').Hope
Purchase = require '../common/models/purchase'
Session = require '../common/session'
C = require '../common/constants'
# mailer = require '../common/mailer'

module.exports = (zen) ->

  zen.put '/api/purchase/stripe', (request, response) ->
    if request.required ['id', 'token']
      token = request.parameters.token
      Hope.shield([ ->
        Session request, response
      , (error, @session) =>
        filter =
          _id: request.parameters.id
          user: @session._id
          state: C.PURCHASE.STATE.UNPAID
        values =
          state: C.PURCHASE.STATE.PAID
          token: token
        Purchase.findAndUpdate filter, values
      , (error, @purchase) =>
        promise = new Hope.Promise()
        values =
          amount: @purchase.amount.toFixed(2).toString().replace('.', '')
          currency: 'usd'
          card: token
          description: @session.mail
        stripe(C.STRIPE.SECRET_KEY).charges.create values, (error, charge) =>
          promise.done error, charge
        promise
      ]).then (error, charge) =>
        if error
          response.json message: error.code, error.message
        else
          response.ok()
          # order = @order.parse()
          # mailer @session.mail, "#{@settings.name} - Order #{order.id} #{order.state_label}", "order",
          #   settings  : @settings
          #   user      : @session
          #   host      : C.HOST[global.ZEN.type.toUpperCase()]
          #   order     : order
          #   lines     : (line.parse() for line in @lines)
