module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    simplemocha:
      options:
        globals: ['expect']
        ui: 'bdd'
        reporter: 'dot'
      all:
        src: 'test/*.coffee'

  grunt.loadNpmTasks 'grunt-simple-mocha'

  grunt.registerTask 'test', ['simplemocha']

  grunt.registerTask 'default', ['test']
