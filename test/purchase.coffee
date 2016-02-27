'use strict'

Test = require('zenrequest').Test

module.exports = ->
  tasks = []
  student = ZENrequest.USERS.STUDENTS[0]
  admin = ZENrequest.USERS.ADMINS[0]
  course = ZENrequest.COURSES[0]
  lesson = ZENrequest.LESSONS[0]
  tasks.push _create(purchase, student) for purchase in ZENrequest.PURCHASES
  tasks.push _read student
  tasks.push _update ZENrequest.PURCHASES[0], student, "User can't update a purchase", 401
  tasks.push _update ZENrequest.PURCHASES[0], admin
  tasks.push _delete ZENrequest.PURCHASES[1], student, "User can't delete a purchase", 401
  tasks.push _delete ZENrequest.PURCHASES[1], admin
  tasks

# PROMISES ---------------------------------------------------------------------
_create = (purchase, user) -> ->
  if purchase.course?
    purchase.course = ZENrequest.COURSES[purchase.course].id
  else if purchase.lesson?
    purchase.lesson = ZENrequest.LESSONS[purchase.lesson].id

  Test 'POST', 'api/purchase', purchase, _session(user), "User creates '#{purchase.course?.id or purchase.lesson?.id}' purchase.", 200, (response) ->
    purchase.id = response.id

_read = (user) -> ->
  Test 'GET', 'api/purchase', null, _session(user), 'User can read him purchases.', 200

_update = (purchase, user, assert = 'Admin can update a purchase.', code = 200) -> ->
  purchase.state = 0
  Test 'PUT', 'api/purchase', purchase, _session(user), assert, code

_delete = (purchase, user, assert = 'Admin can delete a purchase.', code = 200) -> ->
  Test 'DELETE', 'api/purchase', purchase, _session(user), assert, code

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
