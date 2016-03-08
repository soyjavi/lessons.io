Hope = require 'hope'
request = require 'superagent'
# -- Models
# C = require '../../constants'

module.exports =

  get: (endpoint, parameters, timeout = C.API.TIMEOUT) ->
    promise = new Hope.Promise()
    request
      .get "#{_getApiUrl()}#{endpoint}"
      .set _headers()
      .query parameters
      .timeout timeout
      .end (error, response) -> _response promise, endpoint, error, response
    promise

  post: (endpoint, parameters, timeout = C.API.TIMEOUT) ->
    promise = new Hope.Promise()
    request
      .post "#{_getApiUrl()}#{endpoint}"
      .set _headers
      .set 'authorization', _getToken()
      .send parameters
      .timeout timeout
      .end (error, response) -> _response promise, endpoint, error, response
    promise

  put: (endpoint, parameters, timeout = C.API.TIMEOUT) ->
    promise = new Hope.Promise()
    request
      .put "#{_getApiUrl()}#{endpoint}"
      .set _headers
      .set 'authorization', _getToken()
      .send parameters
      .timeout timeout
      .end (error, response) -> _response promise, endpoint, error, response
    promise

  del: (endpoint, parameters, timeout = C.API.TIMEOUT) ->
    promise = new Hope.Promise()
    request
      .del "#{_getApiUrl()}#{endpoint}"
      .set _headers
      .set 'authorization', _getToken()
      .send parameters
      .timeout timeout
      .end (error, response) -> _response promise, endpoint, error, response
    promise

# -- Private methods
_headers = ->
  headers = 'Content-Type': 'application/x-www-form-urlencoded'
  headers.authorization = token if token = _getToken()
  headers

_response = (promise, endpoint, error, response) ->
  if response?.status < 300
    response = if response?.text then JSON.parse response.text else response.status
    console.info "[#{endpoint}]", response
    promise.done null, response
  else
    if error.timeout?
      message = 'Seems cannot connect to the server.'
    else
      message = error.response?.statusText
      message += ": #{error.response.body?.message or error.response.body}" if error.response?.body
    console.error "[#{endpoint}]", error
    if endpoint isnt 'api/metrics'
      new Notification type: 'error', caption: message or 'Undefined error'

    if error.status is 401
      storage 'session', null
      storage 'token', null
      window.location = '#/session/login'
    promise.done error, null

_getToken = ->
  storage('token')?.token or storage('session')?.token or null

_getApiUrl = ->
  host = window.location.host
  urls =
    'spa.mediasmart.mobi': C.API.URL.PRODUCTION
    'bsmart.mediasmart.mobi': C.API.URL.PRODUCTION
    'spatest.mediasmart.mobi': C.API.URL.PREPRODUCTION
    'bsmarttest.mediasmart.mobi': C.API.URL.PREPRODUCTION
    'localhost:8000': C.API.URL.DEVELOPMENT
  urls[host] or C.API.URL.LOCAL
