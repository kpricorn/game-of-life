module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        options:
          join: true
          sourceMap: true
        files:
          'lib/gol.js': ['src/*.coffee']

    'jasmine-node':
      options:
        coffee: true
      run:
        spec: 'spec'
      executable: './node_modules/.bin/jasmine-node'

    concat:
      dist:
        src: ['lib/**/*.js']
        dest: 'dist/<%= pkg.name %>.js'

    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
      dist:
        files:
          'dist/<%= pkg.name %>.min.js': ['<%= concat.dist.dest %>']

    release:
      options:
        npm: false
        npmtag: false

    bower:
      install:
        options:
          targetDir: 'sample/scripts/vendor'
          cleanup: true
          verbose: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine-node'
  grunt.loadNpmTasks 'grunt-release'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-bower-task'

  grunt.registerTask 'default', ['coffee', 'jasmine-node']
  grunt.registerTask 'prepare', ['coffee', 'concat', 'uglify']
