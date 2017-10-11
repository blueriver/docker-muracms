var path = require('path');
var gulp = require('gulp');
var sass = require('gulp-sass');
var wrap = require('gulp-wrap');
var declare = require('gulp-declare');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var cssnano = require('gulp-cssnano');
var rename = require("gulp-rename");
var livereload = require('gulp-livereload');
var autoprefixer = require('gulp-autoprefixer');
var gcmq = require('gulp-group-css-media-queries');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('default', function() {
	gulp.start('scss-theme');
});

gulp.task('watch', function() {
	livereload.listen();
	gulp.watch('scss/**/*.scss', ['scss-theme']);
});

gulp.task('dist', function() {
	gulp.src('scss/**/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer({
			browsers: ['last 2 versions'],
			cascade: false
		}))
		.pipe(gcmq())
		.pipe(cssnano())
		.pipe(gulp.dest('dist/css/'));
});

gulp.task('scss-theme', function() {
	gulp.src('scss/**/*.scss')
		.pipe(sourcemaps.init())
		.pipe(sass().on('error', sass.logError))
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('css/'))
		.pipe(livereload());
});

gulp.task('bootstrap', function() {
	gulp.src('assets/bootstrap/scss/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest('css/'))
});

function swallowError (error) {
	console.log(error.toString());
	this.emit('end');
}
