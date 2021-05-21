const { environment } = require('@rails/webpacker')

// const webpack = require('webpack')
// environment.plugins.append(
//   'Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     Popper: ['popper.js', 'default']
//   })
// )

// ここから
// jQueryとBootstapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: 'popper.js/dist/popper'
  })
)
// ここまで

module.exports = environment
