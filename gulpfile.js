var gulp = require('gulp-npm-run')(require('gulp'), {
  exclude: ['test'],
  include: {'build': 'Compile coffee with inline source-map.'},
  require: ['build'],
  requireStrict: true
})

gulp.task('build:watch', function(){
  gulp.watch('*.coffee', ['build'])
})

// modify 'test'; reuse test fn for gulp test:watch
var test = require('gulp-npm-test')(gulp, {
  testsRe: /\.spec\.coffee$/,
  testCmd: 'node_modules/.bin/mocha'
})

gulp.task('test:watch', function() {
  require('gulp-watch')(['index.js', 'test/*.spec.coffee'], test)
})

gulp.task('dev', 'Develop ...', ['build', 'build:watch', 'test:watch'])
