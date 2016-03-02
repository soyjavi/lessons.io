'use strict'

Hope = require('zenserver').Hope
User = require '../common/models/user'
C = require '../common/constants'

module.exports = (request, response, redirect = false, admin = false) ->
  promise = new Hope.Promise()
  token = request.session
  if token
    filter = token: token, active: true
    if admin
      filter.role = C.USER.ROLE.ADMIN
    else
      filter.active = true
    User.search(filter, limit = 1).then (error, session) ->
      unless session?
        if redirect then promise.done true else do response.unauthorized
      else
        promise.done error, session
  else
    if redirect
      promise.done undefined, undefined
    else
      do response.logout
      do response.unauthorized
  promise
