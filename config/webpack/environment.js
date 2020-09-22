const { environment } = require('@rails/webpacker')

const typescript =  require('./loaders/typescript')
const webpack = require('webpack')
const frameworkConfig = require('./frameworks')

environment.loaders.prepend('typescript', typescript)
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery'
  })
)

environment.config.merge(frameworkConfig)
module.exports = environment
