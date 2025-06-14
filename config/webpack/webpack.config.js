// See the shakacode/shakapacker README and docs directory for advice on customizing your webpackConfig.
const { generateWebpackConfig, merge } = require('shakapacker')
const options = {
  resolve: {
    extensions: ['.css', '.scss']
  }
}
module.exports = merge({}, generateWebpackConfig(), options)