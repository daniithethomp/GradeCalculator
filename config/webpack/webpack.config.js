// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')
const path = require('path')

const options = {
  resolve: {
    extensions: ['.css', '.scss'],
    alias: {
      // force webpack to use the same instance of bootstrap to avoid duplicate imports
      'bootstrap': path.resolve(__dirname, '../../node_modules/bootstrap')
    }
  }
}

module.exports = merge({}, generateWebpackConfig(), options)