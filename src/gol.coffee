define ["lodash"], (_) ->

  NEIGHBOUR_MATRIX = _.flatten((([x, y] for y in [-1..1]) for x in [-1..1]), true)

  class Game
    constructor: (@field = {}) ->
    cells: -> Object.keys(@field).map (k) => @field[k]
    candidates: => _.flatten(@neighboursCoords(cx, cy) for [cx, cy] in @cells(), true)
    neighboursCoords: (x, y) => ([x + tx, y + ty] for [tx, ty] in NEIGHBOUR_MATRIX)
    allDead: -> Object.keys(@field).length == 0
    play: => @turn() until @allDead()
    livingNeighbours: (x, y) => _.select(@neighboursCoords(x, y), ([x, y]) => @field["#{x}/#{y}"]?)
    isAlive: (x, y) -> 3 <= @livingNeighbours(x, y).length <= 4
    turn: => @field = _.object(_.select(@candidates(), ([x, y]) => @isAlive(x, y)).map ([x, y]) => ["#{x}/#{y}", [x, y]])

  Game: Game
