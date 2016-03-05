'use strict'

require('coffee-script/register');
require('babel-register')({ presets: ['es2015', 'stage-0', 'react'] });
require('zenserver').start();

var hook = require('css-modules-require-hook')
var sass = require('node-sass')
var path = require('path')

hook({
  // rootDir: path.join(__dirname, './'),
  rootDir: path.join(__dirname, '../app'),
  extensions: [ '.scss' ],
  generateScopedName: '[name]__[local]___[hash:base64:5]',
  preprocessCss: function (data) {
    return sass.renderSync({ data: data }).css
  }
})
