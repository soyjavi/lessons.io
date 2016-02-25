"use strict"

var mongoose = require("zenserver").Mongoose;

mongoose.connect('mongodb://localhost/lessons-io',function() {
    mongoose.connection.db.dropDatabase();
    require('zenrequest').start();
});
