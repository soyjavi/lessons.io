"use strict"

Test = require("zenrequest").Test

module.exports = ->
  tasks = []
  # -- Owners
  tasks.push _signup(user) for user in ZENrequest.USERS.ADMINS
  tasks.push _signupAlready(user) for user in ZENrequest.USERS.ADMINS
  tasks.push _signin(user) for user in ZENrequest.USERS.ADMINS
  # -- Customers (normal users)
  tasks.push _signup(user) for user in ZENrequest.USERS.STUDENTS
  tasks.push _signin(user) for user in ZENrequest.USERS.STUDENTS
  tasks.push _update ZENrequest.USERS.STUDENTS[0]
  # tasks.push _logout ZENrequest.USERS.STUDENTS[1]
  tasks

# PROMISES ---------------------------------------------------------------------
_signup = (user) -> ->
  Test "POST", "api/signup", user, null, "User #{user.mail} registered.", 200

_signupAlready = (user) -> ->
  Test "POST", "api/signup", user, null, "User #{user.mail} already registered.", 409

_signin = (user) -> ->
  Test "POST", "api/signin", user, null, "User #{user.mail} logged.", 200, (response) ->
    user.token = response.token

_update = (user) -> ->
  Test "PUT", "api/user", user, _session(user), "User #{user.mail} change profile.", 200

_logout = (user) -> ->
  Test "POST", "api/logout", user, _session(user), "User #{user.mail} logged out.", 200

# -- Private methods -----------------------------------------------------------
_session = (user = undefined) ->
  if user?.token? then authorization: user.token else null
