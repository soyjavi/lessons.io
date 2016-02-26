'use strict'

Hope = require('zenserver').Hope

module.exports = (model, query, limit = 0, page = 1, populate = '', sort = updated_at: 'desc') ->
  promise = new Hope.Promise()
  range =  if page > 1 then limit * (page - 1) else 0
  model.find(query).skip(range).limit(limit).populate(populate).sort(sort).exec (error, value) ->
    if limit is 1 and not error
      error = code: 402, message: 'Not found.' if value.length is 0
      value = value[0]
    promise.done error, value
  promise
