'use strict'

shortId = require('shortid')
Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary

Course = new Schema
  _id: type: String, unique: true, default: shortId.generate
  user: type: Schema.ObjectId, ref: 'User'
  title: type: String
  description: type: String
  image: type: String
  source: type: String
  price: type: Number
  lessons: [type: Schema.ObjectId]
  active: type: Boolean, default: true
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Course.statics.create = (values) ->
  promise = new Hope.Promise()
  product = db.model 'Course', Course
  new product(values).save (error, value) -> promise.done error, value
  promise

Course.statics.search = (query, limit = 0, page = 1, populate = '', sort = updated_at: 'desc') ->
  promise = new Hope.Promise()
  range =  if page > 1 then limit * (page - 1) else 0
  @find(query).skip(range).limit(limit).populate(populate).sort(sort).exec (error, value) ->
    if limit is 1 and not error
      error = code: 402, message: 'Not found.' if value.length is 0
      value = value[0]
    promise.done error, value
  promise

Course.statics.findAndUpdate = (filter, values) ->
  promise = new Hope.Promise()
  # -- Specific formats
  values.updated_at = new Date()
  @findOneAndUpdate filter, values, (error, value) ->
    promise.done error, value
  promise

# -- Instance methods ----------------------------------------------------------
Course.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error) -> promise.done error, true
  promise

Course.methods.parse = ->
  id: @_id.toString()
  user: @user?.parse?() or @user
  title: @title
  description: @description
  image: @image
  source: @source
  price: @price.toFixed(2)
  lessons: @lessons
  active: @active
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'Course' , Course
