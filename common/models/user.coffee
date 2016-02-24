'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
C = require '../constants'

User = new Schema
  mail: type: String, unique: true
  role: type: Number, default: C.USER.DEFAULT
  username: type: String, trim: true
  name: type: String
  image: type: String, default: 'image.png'
  token: type: String
  updated_at: type: Date
  created_at: type: Date, default: Date.now

exports = module.exports = db.model 'User', User
