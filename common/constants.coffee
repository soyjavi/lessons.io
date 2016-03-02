'use strict'

module.exports =

  USER:
    ROLE:
      ADMIN: 0
      STUDENT: 1

  SUBSCRIPTION:
    TYPE:
      MONTHLY: 1
      YEARLY: 2
    COLLECTOR:
      STRIPE: 1
      PAYPAL: 2
    STATE:
      UNPAID: 0
      PAID: 1
      DISABLED: 2

  HOST:
    DEVELOPMENT: "#{global.ZEN.protocol}://#{global.ZEN.host}:#{global.ZEN.port}/"
    PRODUCTION: "#{global.ZEN.protocol}://#{global.ZEN.host}/"
