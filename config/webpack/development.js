process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

const CircularDependencyPlugin = require('circular-dependency-plugin')
module.exports = {
    entry: './app/javascript/packs',
    plugins: [
        new CircularDependencyPlugin({
            // exclude detection of files based on a RegExp
            exclude: /a\.js|node_modules/,
            // add errors to webpack instead of warnings
            failOnError: true,
            // set the current working directory for displaying module paths
            cwd: process.cwd(),
        })
    ]
}

module.exports = environment.toWebpackConfig()
