var gulp = require('beverage')(require('gulp'), {
  scripts: {
    include: {'build': 'Compile coffee with inline source-map.'}
  },
  buildWatch: ['index.coffee'],
  test: {},
  testWatch: ['index.js', 'test/*.spec.coffee']
})

gulp.task('dev', 'DEVELOP', [
  'build',
  'test',
  'sourcegate:watch',
  'build:watch',
  'test:watch'
])
