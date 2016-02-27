'use strict'

module.exports =

  USER:
    TYPE:
      ADMIN: 0
      STUDENT: 1

  PURCHASE:
    STATE:
      UNPAID: 0
      PAID: 1

  STRIPE:
    KEY: "sk_live_?"
    # KEY: "sk_test_?"

  HOST:
    DEVELOPMENT: "#{global.ZEN.protocol}://#{global.ZEN.host}:#{global.ZEN.port}/"
    PRODUCTION: "#{global.ZEN.protocol}://#{global.ZEN.host}/"
