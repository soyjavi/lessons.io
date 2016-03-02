'use strict'

Test = require('zenrequest').Test

module.exports = ->
  tasks = []
  session = ZENrequest.USERS.STUDENTS[0]
  admin = ZENrequest.USERS.ADMINS[0]
  course = ZENrequest.COURSES[0]
  lesson = ZENrequest.LESSONS[0]
  tasks.push _create(comment, session, course, undefined) for comment in ZENrequest.COMMENTS[0...4]
  tasks.push _create ZENrequest.COMMENTS[4], session, undefined, lesson
  tasks.push _read session
  tasks.push _delete ZENrequest.COMMENTS[4], admin
  tasks

# PROMISES ---------------------------------------------------------------------
_create = (comment, user, course, lesson) -> ->
  comment.course = course.id if course?
  comment.lesson = lesson.id if lesson?
  Test 'POST', 'api/comment', comment, _session(user), "User create '#{comment.text}' comment.", 200, (response) ->
    comment.id = response.id

_read = (user) -> ->
  Test 'GET', 'api/comment', null, _session(user), 'Anyone can read comments.', 200

_delete = (comment, user) -> ->
  Test 'DELETE', 'api/comment', comment, _session(user), "Admin deletes '#{comment.title}' comment.", 200

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
