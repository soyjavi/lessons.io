'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
PassHash = require 'password-hash'
C = require '../constants'
token = require '../token'
create = require './modules/create'
search = require './modules/search'
findAndUpdate = require './modules/findAndUpdate'

User = new Schema
  mail: type: String, unique: true
  password: type: String
  role: type: Number, default: C.USER.TYPE.STUDENT
  username: type: String, trim: true
  name: type: String
  image: type: String, default: 'user.png'
  token: type: String
  active: type: Boolean, default: true
  updated_at: type: Date
  created_at: type: Date, default: Date.now

# -- Static methods ------------------------------------------------------------
User.statics.create = (values) ->
  create 'Create', Create, values

User.statics.signup = (values) ->
  promise = new Hope.Promise()
  @findOne(mail: values.mail).exec (error, value) ->
    return promise.done true if value?
    user = db.model 'User', User
    values.password = PassHash.generate values.password
    values.token = token values.password
    new user(values).save (error, value) -> promise.done error, value
  promise

User.statics.login = (values) ->
  promise = new Hope.Promise()
  @findOne mail: values.mail, (error, user) =>
    if user is null or not PassHash.verify values.password, user.password
      promise.done true
    else
      user.token = token user._id
      user.save()
      promise.done error, user
  promise

User.statics.search = (query, limit = 0, page = 1, populate = '', sort = created_at: 'desc') ->
  search @, query, limit, page, populate, sort

User.statics.findAndUpdate = (filter, values) ->
  findAndUpdate @, filter, values

# -- Instance methods ----------------------------------------------------------
User.methods.parse = ->
  id: @_id.toString()
  mail: @mail
  username: @username or @mail
  name: @name
  image: @image
  updated_at: @updated_at
  created_at: @created_at

exports = module.exports = db.model 'User', User
