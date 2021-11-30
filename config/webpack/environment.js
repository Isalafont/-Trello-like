const { environment } = require('@rails/webpacker');
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue');
const webpack = require('webpack');

// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');

// Bootstrap 5 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
    // Rails: ' @rails/ujs'
  })
);

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin());
environment.loaders.prepend('vue', vue);

module.exports = environment;
