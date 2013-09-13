require.config({
  baseUrl: './scripts',
  urlArgs: "bust=" + (new Date()).getTime(),
  paths: {
    lodash: 'vendor/lodash/dist/lodash.compat',
    paper: 'vendor/paper/dist/paper',
    'game-of-life': 'vendor/game-of-life/dist/game-of-life'
  }
});

require(['app']);
