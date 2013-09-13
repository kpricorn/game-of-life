define(['lodash', 'paper', 'game-of-life'], function(_, paper, Game) {
  window.Game = Game.Game;
  window.paper = paper
  window.canvas = document.getElementById('gol');
  paper.setup(canvas);

  var game = new Game.Game();
  //game.field['0/0'] = [0, 0];
  //game.field['0/1'] = [0, 1];
  //game.field['0/2'] = [0, 2];

  // Beacon
  game.field['0/0'] = [0, 0];
  game.field['0/1'] = [0, 1];
  game.field['1/0'] = [1, 0];
  game.field['1/1'] = [1, 1];
  game.field['2/2'] = [2, 2];
  game.field['2/3'] = [2, 3];
  game.field['3/2'] = [3, 2];
  game.field['3/3'] = [3, 3];

  // glider
  //game.field['0/0'] = [0, 0];
  //game.field['1/0'] = [1, 0];
  //game.field['1/1'] = [1, 1];
  //game.field['1/-1'] = [1, -1];
  //game.field['2/-1'] = [2, -1];

  xOffset = canvas.width / 2;
  yOffset = canvas.height / 2;
  var rects = [];

  var tick = function() {
    var topLeft;
    var rect;
    var x;
    var y;
    var rect;
    _.invoke(rects, 'remove');
    rects = _.map(game.cells(), function(c) {
      x = c[0] + xOffset;
      y = c[1] + yOffset;
      topLeft = new paper.Point(x, y);
      rect = new paper.Path.Rectangle(topLeft, [1, 1]);
      rect.fillColor = 'red';
      return rect;
    });
    paper.view.draw();
    game.turn();
    setTimeout(tick, 500)
  };

  tick();
});
