'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
C = require '../constants'
create = require './modules/create'
search = require './modules/search'
findAndUpdate = require './modules/findAndUpdate'

Subscription = new Schema
  user: type: Schema.ObjectId, ref: 'User'
  amount: type: Number, default: 0
  state: type: Number, default: C.SUBSCRIPTION.STATE.UNPAID
  type: type: Number, default: C.SUBSCRIPTION.TYPE.MONTHLY
  collector: type: Number, default: C.SUBSCRIPTION.COLLECTOR.STRIPE
  token: type: String
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Subscription.statics.create = (values) ->
  create 'Subscription', Subscription, values

Subscription.statics.search = (query, limit = 0, page = 1, populate = [], sort = updated_at: 'desc') ->
  search @, query, limit, page, populate, sort

Subscription.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

# -- Instance methods ----------------------------------------------------------
Subscription.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error) -> promise.done error, true
  promise

Subscription.methods.parse = ->
  id: @_id.toString()
  user: @user?.parse?() or @user
  amount: @amount.toFixed(2)
  state: @state
  type: @type
  token: @token
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'Subscription', Subscription
