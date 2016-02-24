'use strict'

shortId = require('shortid')
Hope = require('zenserver').Hope
Schema = require('zenserver').Mongoose.Schema
db = require('zenserver').Mongo.connections.primary

Lesson = new Schema
  _id: type: String, unique: true, default: shortId.generate
  user: type: Schema.ObjectId, ref: 'User'
  course: type: Schema.ObjectId, ref: 'Course'
  title: type: String
  description: type: String
  image: type: String
  source: type: String
  price: type: Number
  updated_at: type: Date
  created_at: type: Date, default: Date.now

exports = module.exports = db.model 'Lesson', Lesson
