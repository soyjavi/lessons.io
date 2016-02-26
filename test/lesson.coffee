"use strict"

Test = require('zenrequest').Test

module.exports = ->
  tasks = []
  session = ZENrequest.USERS.ADMINS[0]
  course = ZENrequest.COURSES[0]
  tasks.push _create(lesson, course, session) for lesson in ZENrequest.LESSONS
  tasks.push _read session
  tasks.push _update ZENrequest.LESSONS[0], session
  tasks.push _delete ZENrequest.LESSONS[2], session
  tasks

# PROMISES ---------------------------------------------------------------------
_create = (lesson, course, user) -> ->
  lesson.course = course.id
  Test 'POST', 'api/lesson', lesson, _session(user), "Admin create '#{lesson.title}' lesson.", 200, (response) ->
    lesson.id = response.id

_read = (user) -> ->
  Test 'GET', 'api/lesson', null, _session(user), "Admin can read him lessons.", 200

_update = (lesson, user) -> ->
  lesson.title += "+"
  Test 'PUT', 'api/lesson', lesson, _session(user), "Admin updates '#{lesson.title}' lesson.", 200

_delete = (lesson, user) -> ->
  Test 'DELETE', 'api/lesson', lesson, _session(user), "Admin deletes '#{lesson.title}' lesson.", 200

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
