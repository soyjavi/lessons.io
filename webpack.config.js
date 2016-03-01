const pkg = require('./package');
const path = require('path');
const webpack = require('webpack');
const autoprefixer = require('autoprefixer');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: __dirname,

  watch: true,

  entry: {
    app: ['./app/index.jsx']
  },

  output: {
    path: path.join(__dirname, 'static'),
    filename: pkg.name + '.[name].js',
  },

  resolve: {
    extensions: ['', '.jsx', '.js', '.scss', '.json'],
    modulesDirectories: [
      'node_modules',
      path.resolve(__dirname, './node_modules')
    ]
  },

  module: {
    loaders: [
      {
        test: /(\.js|\.jsx)$/,
        exclude: /(node_modules)/,
        loader: 'babel',
        query: { presets: ['es2015', 'stage-0', 'react'] }
      }, {
        test: /(\.scss|\.css)$/,
        loader: ExtractTextPlugin.extract('style', 'css?sourceMap&modules&importLoaders=1&localIdentName=[name]__[local]___[hash:base64:5]!postcss!sass?sourceMap')
        // loader: ExtractTextPlugin.extract('style', 'css!postcss!sass')
      }
    ]
  },

  toolbox: {
    theme: path.join(__dirname, 'app/toolbox-theme.scss')
  },

  postcss: [autoprefixer],

  // externals: {
  //   "react": "React"
  // },

  plugins: [
    new ExtractTextPlugin(pkg.name + '.[name].css', { allChunks: true }),
  ]
};
