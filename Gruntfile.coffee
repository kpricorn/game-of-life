module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    coffee:
      compile:
        options:
          join: true
          sourceMap: true
        files:
          'lib/gol.js': ['src/*.coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
