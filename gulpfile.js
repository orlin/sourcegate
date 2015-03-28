var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    sourcemaps = require('gulp-sourcemaps')

gulp.task('coffee', function() {
  gulp.src('./*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest('./'))
})

gulp.task('coffee:watch', function(){
  gulp.watch('./*.coffee', ['coffee'])
})

// modify 'test'; reuse test fn for gulp test:watch
var test = require('gulp-npm-test')(gulp, {
  testsRe: /\.spec\.coffee$/,
  testCmd: 'node_modules/.bin/mocha'
})

gulp.task('test:watch', function() {
  require('gulp-watch')(['./index.js', 'test/*.spec.coffee'], test)
})

gulp.task('default', ['coffee', 'coffee:watch', 'test:watch'])
