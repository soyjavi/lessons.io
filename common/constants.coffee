'use strict'

module.exports =

  USER:
    TYPE:
      ADMIN: 0
      STUDENT: 1

  ORDER:
    STATE:
      SHOPPING: 0
      PURCHASED: 1
      PROCESSED: 2
      SENT: 3
      FINISHED: 4

  STRIPE:
    KEY: "sk_live_?"
    # KEY: "sk_test_?"

  HOST:
    DEVELOPMENT: "#{global.ZEN.protocol}://#{global.ZEN.host}:#{global.ZEN.port}/"
    PRODUCTION: "#{global.ZEN.protocol}://#{global.ZEN.host}/"
