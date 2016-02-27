'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
create = require './modules/create'
search = require './modules/search'
findAndUpdate = require './modules/findAndUpdate'

Comment = new Schema
  user: type: Schema.ObjectId, ref: 'User'
  course: type: String, ref: 'Course'
  lesson: type: String, ref: 'lesson'
  text: type: String
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Comment.statics.create = (values) ->
  create 'Comment', Comment, values

Comment.statics.search = (query, limit = 0, page = 1, populate = '', sort = created_at: 'desc') ->
  search @, query, limit, page, populate, sort

Comment.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

# -- Instance methods ----------------------------------------------------------
Comment.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error) -> promise.done error, true
  promise

Comment.methods.parse = ->
  id: @_id.toString()
  user: @user?.parse?() or @user
  course: @course?.parse?() or @course
  lesson: @lesson?.parse?() or @lesson
  text: @text
  created_at: @created_at

exports = module.exports = db.model 'Comment', Comment
