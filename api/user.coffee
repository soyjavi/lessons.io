'use strict'

Hope = require('zenserver').Hope

C = require '../common/constants'
mailer = require '../common/mailer'
Session = require '../common/session'
User = require '../common/models/user'

module.exports = (zen) ->

  zen.post '/api/signup', (request, response) ->
    if request.required ['mail', 'password']
      Hope.chain([ ->
        User.search role: C.USER.ROLE.ADMIN
      , (error, users) ->
        if users.length > 0
          request.parameters.role = C.USER.ROLE.STUDENT
        else
          request.parameters.role = C.USER.ROLE.ADMIN
        User.signup request.parameters
      ]).then (error, @user) =>
        return response.conflict() if error?
        response.session @user.token
        user = @user.parse()
        user.token = @user.token
        response.json user
        if @user.role isnt C.USER.ROLE.ADMIN
          mailer @user.mail, 'Welcome to Sessions.io', 'welcome',
            host: C.HOST[global.ZEN.type.toUpperCase()]
            user: @user

  zen.post '/api/signin', (request, response) ->
    if request.required ['mail', 'password']
      User.login(request.parameters).then (error, user) ->
        return response.unauthorized() if error
        response.session user.token
        result = user.parse()
        result.token = user.token
        response.json result

  zen.post '/api/logout', (request, response) ->
    response.logout()
    response.ok()

  zen.get '/api/user', (request, response) ->
    Session(request, response).then (error, session) ->
      response.json session.parse()

  zen.put '/api/user', (request, response) ->
    Session(request, response).then (error, session) ->
      parameters = {}
      keys = ['username', 'name', 'image', 'billing']
      for key in keys when request.parameters[key]?
        parameters[key] = request.parameters[key]
      User.findAndUpdate(_id: session._id, parameters).then (error, user) ->
        if error?
          response.json message: error.message, error.code
        else
          response.json user.parse()
