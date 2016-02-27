'use strict'

shortId = require('shortid')
Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
create = require './modules/create'
search = require './modules/search'
findAndUpdate = require './modules/findAndUpdate'

Lesson = new Schema
  _id: type: String, unique: true, default: shortId.generate
  user: type: Schema.ObjectId, ref: 'User'
  course: type: String, ref: 'Course'
  title: type: String
  description: type: String
  image: type: String
  source: type: String
  price: type: Number, default: 0
  active: type: Boolean, default: true
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
Lesson.statics.create = (values) ->
  create 'Lesson', Lesson, values

Lesson.statics.search = (query, limit = 0, page = 1, populate = '', sort = updated_at: 'desc') ->
  search @, query, limit, page, populate, sort

Lesson.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

# -- Instance methods ----------------------------------------------------------
Lesson.methods.delete = ->
  promise = new Hope.Promise()
  @remove (error) -> promise.done error, true
  promise

Lesson.methods.parse = ->
  id: @_id.toString()
  user: @user?.parse?() or @user
  course: @course?.parse?() or @course
  title: @title
  description: @description
  image: @image
  source: @source
  price: @price.toFixed(2)
  active: @active
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'Lesson' , Lesson
