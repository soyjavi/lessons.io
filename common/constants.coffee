'use strict'

module.exports =

  USER:
    TYPE:
      ADMIN: 0
      STUDENT: 1

  PURCHASE:
    TYPE:
      STRIPE: 1
    STATE:
      UNPAID: 0
      PAID: 1

  HOST:
    DEVELOPMENT: "#{global.ZEN.protocol}://#{global.ZEN.host}:#{global.ZEN.port}/"
    PRODUCTION: "#{global.ZEN.protocol}://#{global.ZEN.host}/"
