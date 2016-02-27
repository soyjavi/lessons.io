'use strict'

Hope = require('zenserver').Hope
Mustache = require('zenserver').Mustache
nodemailer = require 'nodemailer'
smtpTransport = require 'nodemailer-smtp-transport'
fs = require 'fs'
premailer = require 'premailer-api'
if global.ZEN.mail
  transport   = nodemailer.createTransport smtpTransport
    host: global.ZEN.mail.host
    auth:
      user: global.ZEN.mail.user
      pass: global.ZEN.mail.password

module.exports = (to, subject, file, bindings) ->
  if transport
    files = {}
    files["mail.#{file}"] = __mustache "mail.#{file}"
    body = Mustache.render __mustache('mail'), bindings, files

    premailer.prepare html: body, (error, email) =>
      unless error
        # -- Mail data
        data =
          from: "#{global.ZEN.mail.name} <#{global.ZEN.mail.user}>"
          to: to
          subject: subject
          html: email.html
        # -- Send email
        transport.sendMail data, (error, value) ->
          console.log error
          console.log ' *', '[MAIL]', "#{subject} to #{to}"

# -- Private methods -----------------------------------------------------------
__cachedMustache = {}

__mustache = (name) ->
  folder = "#{__dirname}/../www/mustache/"
  if global.ZEN.path and global.ZEN.mustache?.folder
    folder_path = "#{global.ZEN.path}/#{global.ZEN.mustache.folder}/"

  if __cachedMustache[name] and (global.ZEN.mustache?.cache or not global.ZEN.mustache)
    __cachedMustache[name]
  else if folder_path and fs.existsSync file = "#{folder_path}#{name}.mustache"
    __cachedMustache[name] = fs.readFileSync file, 'utf8'
  else if fs.existsSync file = "#{folder}#{name}.mustache"
    __cachedMustache[name] = fs.readFileSync file, 'utf8'
  else
    __cachedMustache[name] = ''
