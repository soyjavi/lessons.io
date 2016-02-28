'use strict'

require('coffee-script/register');
require('babel-register')({ presets: ['es2015', 'stage-0', 'react'] });
require('zenserver').start();
