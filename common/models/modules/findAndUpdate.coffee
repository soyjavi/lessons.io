'use strict'

Hope = require('zenserver').Hope

module.exports = (model, filter, values) ->
  promise = new Hope.Promise()
  values.updated_at = new Date()
  model.findOneAndUpdate filter, values, (error, value) ->
    promise.done error, value
  promise
