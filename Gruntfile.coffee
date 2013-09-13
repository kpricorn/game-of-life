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

    'jasmine-node':
      options:
        coffee: true
      run:
        spec: "spec"
      executable: './node_modules/.bin/jasmine-node'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jasmine-node'

  grunt.registerTask 'default', ['coffee']
