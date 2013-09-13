define ["lodash"], (_) ->

  NEIGHBOUR_MATRIX = _.flatten((([x, y] for y in [-1..1]) for x in [-1..1]), true)

  class Game
    constructor: (@field = {}) ->
    get: (x, y) -> @field["#{x}/#{y}"]
    set: (x, y) -> @field[@toInternal(x, y)[0]] = @toInternal(x, y)[1]
    toInternal: (x, y) -> ["#{x}/#{y}", [x, y]]
    cells: ->
      Object.keys(@field).map (k) => @field[k]
    candidates: =>
      _.flatten(@neighboursCoords(cx, cy) for [cx, cy] in @cells(), true)
    neighboursCoords: (x, y) =>
      ([x + tx, y + ty] for [tx, ty] in NEIGHBOUR_MATRIX)
    allDead: -> Object.keys(@field).length == 0
    play: => @turn() until @allDead()
    livingNeighbours: (x, y) =>
      _.select(@neighboursCoords(x, y), ([x, y]) => @get(x, y)?)
    isAlive: (x, y) =>
      if @get(x, y)?
        1 < @livingNeighbours(x, y).length - 1 < 4
      else
        @livingNeighbours(x, y).length == 3
    turn: =>
      @field = _.object(_.select(@candidates(), ([x, y]) => @isAlive(x, y)).map ([x, y]) =>
        @toInternal(x, y)
      )

  Game: Game
