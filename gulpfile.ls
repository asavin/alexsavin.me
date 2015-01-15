#LiveScript gulp file
require! {
  'gulp'
  'gulp-clean'
}

gulp.task 'something' ->
  console.log 'TODO: Add a useful task'

gulp.task 'default' ['something']
