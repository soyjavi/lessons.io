"use strict"

module.exports = (zen) ->

  zen.get "/api/user", (request, response) ->
    response.json hello: 'world'
