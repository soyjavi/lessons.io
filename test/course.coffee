"use strict"

Test = require('zenrequest').Test

module.exports = ->
  tasks = []
  session = ZENrequest.USERS.ADMINS[0]
  tasks.push _create(course, session) for course in ZENrequest.COURSES
  tasks.push _read session
  tasks.push _update ZENrequest.COURSES[0], session
  tasks.push _delete ZENrequest.COURSES[2], session
  tasks

# PROMISES ---------------------------------------------------------------------
_create = (course, user) -> ->
  Test 'POST', 'api/course', course, _session(user), "Admin create '#{course.title}' course.", 200, (response) ->
    course.id = response.id

_read = (user) -> ->
  Test 'GET', 'api/course', null, _session(user), "Admin can read him courses.", 200

_update = (course, user) -> ->
  course.title += "+"
  Test 'PUT', 'api/course', course, _session(user), "Admin updates '#{course.title}' course.", 200

_delete = (course, user) -> ->
  Test 'DELETE', 'api/course', course, _session(user), "Admin deletes '#{course.title}' course.", 200

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
