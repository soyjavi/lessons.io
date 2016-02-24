'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary
C = require '../constants'

Purchase = new Schema
  user: type: Schema.ObjectId, ref: 'User'
  course: type: Schema.ObjectId, ref: 'Course'
  lesson: type: Schema.ObjectId, ref: 'lesson'
  state: type: Number, default: C.ORDER.STATE.SHOPPING
  token: type: String
  updated_at: type: Date
  created_at: type: Date, default: Date.now

exports = module.exports = db.model 'Purchase', Purchase
