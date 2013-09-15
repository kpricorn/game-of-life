module.exports = (grunt) ->
  pkg: grunt.file.readJSON '../package.json'
  grunt.initConfig
    bower:
      install:
        options:
          targetDir: 'scripts/vendor'
          cleanup: true
          verbose: true

  grunt.loadNpmTasks 'grunt-bower-task'

  grunt.registerTask 'default', ['bower']
