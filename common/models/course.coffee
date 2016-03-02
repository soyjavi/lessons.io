'use strict'

shortId = require('shortid')
Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
search = require './modules/search'
create = require './modules/create'
findAndUpdate = require './modules/findAndUpdate'

Course = new Schema
  _id: type: String, unique: true, default: shortId.generate
  user: type: Schema.ObjectId, ref: 'User'
  title: type: String
  description: type: String
  image: type: String
  source: type: String
  lessons: [type: Schema.ObjectId]
  active: type: Boolean, default: true
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Course.statics.create = (values) ->
  create 'Course', Course, values

Course.statics.search = (query, limit = 0, page = 1, populate = '', sort = updated_at: 'desc') ->
  search @, query, limit, page, populate, sort

Course.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

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
  lessons: @lessons
  active: @active
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'Course' , Course
