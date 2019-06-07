var Encore = require('@symfony/webpack-encore');

Encore
    // directory where compiled assets will be stored
    .setOutputPath('src/UtExam/ProEvalBundle/Resources/public/build/')
    // public path used by the web server to access the output path
    .setPublicPath('/build')
    // only needed for CDN's or sub-directory deploy
    //.setManifestKeyPrefix('build/')

    /*
     * ENTRY CONFIG
     *
     * Add 1 entry for each "page" of your app
     * (including one that's included on every page - e.g. "app")
     * 
     * Each entry will result in one JavaScript file (e.g. app.js)
     * and one CSS file (e.g. app.css) if you JavaScript imports CSS.
     */
    .addEntry('outputJs', './src/UtExam/ProEvalBundle/Resources/public/js/main.js')
    .addEntry('outputAdminJs', './src/UtExam/ProEvalBundle/Resources/public/js/admin/adminMain.js')
    .addStyleEntry('outputCss', './src/UtExam/ProEvalBundle/Resources/public/styles/index.scss')
    // .addStyleEntry('prueba', './src/ciberConnect/shopBundle/Resources/public/styles/prueba.scss')
    //.addEntry('page1', './assets/js/page1.js')
    //.addEntry('page2', './assets/js/page2.js')

    .enableBuildNotifications()

    .enableSassLoader()

    .autoProvidejQuery()
    // uncomment if you use TypeScript
    //.enableTypeScriptLoader()

    // uncomment if you use Sass/SCSS files
    //.enableSassLoader()

    // uncomment if you're having problems with a jQuery plugin
    //.autoProvidejQuery()
;

module.exports = Encore.getWebpackConfig();


// const path = require("path");
// const webpack = require('webpack');
// // window.$ = window.jQuery = require('jquery');
//
// module.exports = {
//   mode: 'none',
//   watch: true,
//   entry: path.join(__dirname, 'src/UtExam/ProEvalBundle/Resources/public/js/main.js'),
//   module: {
//     rules: [
//       {
//         test: /vendor\/.+\.(jsx|js)$/,
//         use: ['imports?jQuery=jquery,$=jquery,this=>window', 'babel-preset-es2015']
//       },
//     ]
//   },
//   output: {
//     path: path.join(__dirname, 'src/UtExam/ProEvalBundle/Resources/public/js'),
//     filename: 'output.js',
//   },
//   resolve: {
//     alias: {
//         jquery: "jquery/src/jquery"
//     }
//   },
//   plugins: [
//     new webpack.DefinePlugin({
//       'process.env': {
//         'NODE_ENV': JSON.stringify('production')
//       }
//     })
//   ],
//   node: {
//     fs: "empty"
//   }
// }

//______________
// module.exports = {
//   mode: 'none',
//   watch: true,
//   entry: path.join(__dirname, 'src/UtExam/ProEvalBundle/Resources/public/js/admin/adminMain.js'),
//   module: {
//     rules: [
//       {
//         test: /vendor\/.+\.(jsx|js)$/,
//         use: ['imports?jQuery=jquery,$=jquery,this=>window', 'babel-preset-es2015']
//       },
//     ]
//   },
//   output: {
//     path: path.join(__dirname, 'src/UtExam/ProEvalBundle/Resources/public/js/admin'),
//     filename: 'output.js',
//   },
//   resolve: {
//     alias: {
//
//         jquery: "jquery/src/jquery"
//     }
//   },
//   plugins: [
//     new webpack.DefinePlugin({
//       'process.env': {
//         'NODE_ENV': JSON.stringify('production')
//       }
//     })
//   ],
//   node: {
//     fs: "empty"
//   }
// }
