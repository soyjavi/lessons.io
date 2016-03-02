'use strict'

stripe = require 'stripe'
Hope = require('zenserver').Hope

C = require '../common/constants'
mailer = require '../common/mailer'
Session = require '../common/session'
Subscription = require '../common/models/subscription'

module.exports = (zen) ->

  zen.put '/api/subscription/stripe', (request, response) ->
    if request.required ['id', 'token']
      token = request.parameters.token
      Hope.shield([ ->
        Session request, response
      , (error, @session) =>
        filter =
          _id: request.parameters.id
          user: @session._id
          state: C.SUBSCRIPTION.STATE.UNPAID
        values =
          state: C.SUBSCRIPTION.STATE.PAID
          token: token
        Subscription.findAndUpdate filter, values
      , (error, @subscription) =>
        promise = new Hope.Promise()
        values =
          amount: @subscription.amount.toFixed(2).toString().replace('.', '')
          currency: 'usd'
          card: token
          description: @session.mail
        stripe(C.STRIPE.SECRET_KEY).charges.create values, (error, charge) ->
          promise.done error, charge
        promise
      ]).then (error, charge) ->
        if error
          response.json message: error.code, error.message
        else
          response.ok()
          mailer @user.mail, 'Thanks for your subscription', 'subscription',
            host: C.HOST[global.ZEN.type.toUpperCase()]
            user: @user
