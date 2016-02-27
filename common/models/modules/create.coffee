'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary

module.exports = (name, schema, values) ->
  promise = new Hope.Promise()
  mongoModel = db.model name, schema
  new mongoModel(values).save (error, value) -> promise.done error, value
  promise
