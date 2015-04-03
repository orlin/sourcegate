var gulp = require('beverage')(require('gulp'), {
  scripts: {
    include: {'build': 'Compile coffee with inline source-map.'}
  },
  buildWatch: ['*.coffee'],
  test: {
    testsRe: /\.spec\.coffee$/,
  },
  testWatch: ['index.js', 'test/*.spec.coffee']
})

gulp.task('dev', 'DEVELOP', ['build', 'test', 'build:watch', 'test:watch'])
