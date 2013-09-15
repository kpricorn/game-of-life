require.config({
  baseUrl: './scripts',
  urlArgs: "bust=" + (new Date()).getTime(),
  paths: {
    lodash: 'vendor/lodash/lodash.compat',
    jquery: 'vendor/jquery/jquery',
    underscore: 'vendor/underscore/underscore-amd/underscore',
    paper: 'vendor/paper/paper',
    'game-of-life': 'vendor/game-of-life/dist/game-of-life',
    backbone: 'vendor/backbone/backbone-amd/backbone'
  }
});

require(['app'], function(App){
  $(function() {
    App.initialize();
  });
});
