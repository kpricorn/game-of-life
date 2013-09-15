(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(["lodash"], function(_) {
    var Game, NEIGHBOUR_MATRIX, x, y;
    NEIGHBOUR_MATRIX = _.flatten((function() {
      var _i, _results;
      _results = [];
      for (x = _i = -1; _i <= 1; x = ++_i) {
        _results.push((function() {
          var _j, _results1;
          _results1 = [];
          for (y = _j = -1; _j <= 1; y = ++_j) {
            _results1.push([x, y]);
          }
          return _results1;
        })());
      }
      return _results;
    })(), true);
    Game = (function() {
      function Game(field) {
        this.field = field != null ? field : {};
        this.turn = __bind(this.turn, this);
        this.isAlive = __bind(this.isAlive, this);
        this.livingNeighbours = __bind(this.livingNeighbours, this);
        this.play = __bind(this.play, this);
        this.neighboursCoords = __bind(this.neighboursCoords, this);
        this.candidates = __bind(this.candidates, this);
      }

      Game.prototype.get = function(x, y) {
        return this.field["" + x + "/" + y];
      };

      Game.prototype.set = function(x, y) {
        return this.field[this.toInternal(x, y)[0]] = this.toInternal(x, y)[1];
      };

      Game.prototype.toInternal = function(x, y) {
        return ["" + x + "/" + y, [x, y]];
      };

      Game.prototype.cells = function() {
        var _this = this;
        return Object.keys(this.field).map(function(k) {
          return _this.field[k];
        });
      };

      Game.prototype.candidates = function() {
        var cx, cy;
        return _.flatten((function() {
          var _i, _len, _ref, _ref1, _results;
          _ref = this.cells();
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            _ref1 = _ref[_i], cx = _ref1[0], cy = _ref1[1];
            _results.push(this.neighboursCoords(cx, cy));
          }
          return _results;
        }).call(this), true);
      };

      Game.prototype.neighboursCoords = function(x, y) {
        var tx, ty, _i, _len, _ref, _results;
        _results = [];
        for (_i = 0, _len = NEIGHBOUR_MATRIX.length; _i < _len; _i++) {
          _ref = NEIGHBOUR_MATRIX[_i], tx = _ref[0], ty = _ref[1];
          _results.push([x + tx, y + ty]);
        }
        return _results;
      };

      Game.prototype.allDead = function() {
        return Object.keys(this.field).length === 0;
      };

      Game.prototype.play = function() {
        var _results;
        _results = [];
        while (!this.allDead()) {
          _results.push(this.turn());
        }
        return _results;
      };

      Game.prototype.livingNeighbours = function(x, y) {
        var _this = this;
        return _.select(this.neighboursCoords(x, y), function(_arg) {
          var x, y;
          x = _arg[0], y = _arg[1];
          return _this.get(x, y) != null;
        });
      };

      Game.prototype.isAlive = function(x, y) {
        var _ref;
        if (this.get(x, y) != null) {
          return (1 < (_ref = this.livingNeighbours(x, y).length - 1) && _ref < 4);
        } else {
          return this.livingNeighbours(x, y).length === 3;
        }
      };

      Game.prototype.turn = function() {
        var _this = this;
        return this.field = _.object(_.select(this.candidates(), function(_arg) {
          var x, y;
          x = _arg[0], y = _arg[1];
          return _this.isAlive(x, y);
        }).map(function(_arg) {
          var x, y;
          x = _arg[0], y = _arg[1];
          return _this.toInternal(x, y);
        }));
      };

      return Game;

    })();
    return {
      Game: Game
    };
  });

}).call(this);
