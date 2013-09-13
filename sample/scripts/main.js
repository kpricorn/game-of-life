require.config({
  baseUrl: './scripts',
  paths: {
    lodash: 'vendor/lodash/dist/lodash.compat',
    paper: 'vendor/paper/dist/paper'
  }
});

require(['app']);
