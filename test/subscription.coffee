'use strict'

Test = require('zenrequest').Test

module.exports = ->
  tasks = []
  STUDENTS = ZENrequest.USERS.STUDENTS
  student = STUDENTS[0]
  admin = ZENrequest.USERS.ADMINS[0]
  tasks.push _create(subscription, STUDENTS[index]) for subscription, index in ZENrequest.SUBSCRIPTIONS
  tasks.push _read student
  tasks.push _update ZENrequest.SUBSCRIPTIONS[0], student, "User can't update a subscription", 401
  tasks.push _update ZENrequest.SUBSCRIPTIONS[0], admin
  tasks.push _delete ZENrequest.SUBSCRIPTIONS[1], student, "User can't delete a subscription", 401
  tasks.push _delete ZENrequest.SUBSCRIPTIONS[1], admin
  tasks

# PROMISES ---------------------------------------------------------------------
_create = (subscription, user) -> ->
  type = if subscription.type is 2 then 'yearly' else 'monthly'
  Test 'POST', 'api/subscription', subscription, _session(user), "User creates a '#{type}' subscription.", 200, (response) ->
    subscription.id = response.id

_read = (user) -> ->
  Test 'GET', 'api/subscription', null, _session(user), 'User can read him subscriptions.', 200

_update = (subscription, user, assert = 'Admin can update a subscription.', code = 200) -> ->
  subscription.state = 0
  Test 'PUT', 'api/subscription', subscription, _session(user), assert, code

_delete = (subscription, user, assert = 'Admin can delete a subscription.', code = 200) -> ->
  Test 'DELETE', 'api/subscription', subscription, _session(user), assert, code

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
