require.config({
  baseUrl: './scripts',
  urlArgs: "bust=" + (new Date()).getTime(),
  paths: {
    lodash: 'vendor/lodash/dist/lodash.compat',
    jquery: 'vendor/jquery/jquery',
    underscore: 'vendor/underscore-amd/underscore',
    paper: 'vendor/paper/dist/paper',
    'game-of-life': 'vendor/game-of-life/dist/game-of-life',
    backbone: 'vendor/backbone-amd/backbone'
  }
});

require(['app'], function(App){
  $(function() {
    App.initialize();
  });
});
