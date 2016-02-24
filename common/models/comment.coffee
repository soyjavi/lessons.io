'use strict'

Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary

Comment = new Schema
  _id: type: String, unique: true, default: shortId.generate
  user: type: Schema.ObjectId, ref: 'User'
  course: type: Schema.ObjectId, ref: 'Course'
  lesson: type: Schema.ObjectId, ref: 'lesson'
  text: type: String
  created_at: type: Date, default: Date.now

exports = module.exports = db.model 'Comment', Comment
