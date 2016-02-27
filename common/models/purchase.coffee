'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
C = require '../constants'
create = require './modules/create'
search = require './modules/search'
findAndUpdate = require './modules/findAndUpdate'

Purchase = new Schema
  user: type: Schema.ObjectId, ref: 'User'
  course: type: String, ref: 'Course'
  lesson: type: String, ref: 'Lesson'
  state: type: Number, default: C.PURCHASE.STATE.UNPAID
  token: type: String
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Purchase.statics.create = (values) ->
  create 'Purchase', Purchase, values

Purchase.statics.search = (query, limit = 0, page = 1, populate = ['course', 'lesson'], sort = updated_at: 'desc') ->
  search @, query, limit, page, populate, sort

Purchase.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

# -- Instance methods ----------------------------------------------------------
Purchase.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error) -> promise.done error, true
  promise

Purchase.methods.parse = ->
  id: @_id.toString()
  user: @user?.parse?() or @user
  course: @course?.parse?() or @course
  lesson: @lesson?.parse?() or @lesson
  state: @state
  token: @token
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'Purchase', Purchase
