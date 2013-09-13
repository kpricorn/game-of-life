root = if global? then global else window
root._ = require('lodash')

{Game} = require '../lib/gol'

describe 'game of life', ->
  describe Game, ->
    beforeEach ->
      @game = new Game

    it 'can be instantiated', ->
      expect(@game).toBeDefined()

    it 'generates a random seed', ->
      expect(@game.field).toBeDefined()

    it 'takes a seed', ->
      seed = {}
      expect(new Game(seed).field).toBe(seed)

    it 'accepts a turn', ->
      expect(@game.turn).not.toThrow()

    describe '#allDead', ->
      describe 'when no node on the field', ->
        it 'returns true', ->
          expect(@game.allDead()).toBeTruthy()

      describe 'when at least one node on the field', ->
        it 'returns false', ->
          @game.field['foo'] = 'bar'
          expect(@game.allDead()).toBeFalsy()

    describe '#cells', ->
      describe 'with a living cell on 0/0', ->
        it 'can be accessed with the coordinates', ->
          @game.field['0/0'] = [0, 0]
          expect(@game.field['0/0']).toEqual([0,0])

      describe 'with a living cell on 0/0', ->
        it 'returns an array with the coordinate hash', ->
          @game.field['0/0'] = [0, 0]
          expect(@game.cells()).toEqual([ [0, 0] ])

    describe '#candidates', ->
      describe 'with only dead cells', ->
        it 'returns an empty list', ->
          expect(@game.candidates()).toEqual([])

      describe 'with one living cell on 0/0', ->
        it 'returns the neighbour matrix', ->
          @game.field['0/0'] = [0, 0]
          n = @game.candidates().map (c) -> c.join('/')
          c = NEIGHBOUR_MATRIX.map (n) -> n.join('/')
          expect(_.difference(n, c)).toEqual([])

    describe '#neighboursCoords', ->
      describe 'for 0/0', ->
        it 'corresponds to the NEIGHBOUR_MATRIX', ->
          n = @game.neighboursCoords(0, 0).map (c) -> c.join('/')
          c = NEIGHBOUR_MATRIX.map (n) -> n.join('/')
          expect(_.difference(n, c)).toEqual([])

    describe '#livingNeighbours', ->
      describe 'with only 0/0', ->
        it 'returns itself', ->
          @game.field['0/0'] = [0, 0]
          expect(@game.livingNeighbours(0, 0)).toEqual([ [0, 0] ])

      describe 'with only 0/1', ->
        it 'returns itself', ->
          @game.field['0/0'] = [0, 0]
          @game.field['0/1'] = [0, 1]
          expect(@game.livingNeighbours(0, 0)).toEqual([ [0, 0], [0, 1] ])

    describe '#isAlive', ->
      describe 'with only 0/0', ->
        it 'returns false', ->
          @game.field['0/0'] = [0, 0]
          expect(@game.isAlive(0, 0)).toBeFalsy()

    describe 'NEIGHBOUR_MATRIX', ->
      it 'returns the neighbour matrix', ->
        e = [
          [ -1, -1 ], [  0, -1 ], [  1, -1 ],
          [ -1,  0 ], [  0,  0 ], [  1,  0 ],
          [ -1,  1 ], [  0,  1 ], [  1,  1 ],
        ].map (_e) -> _e.join('/')
        n = NEIGHBOUR_MATRIX.map (_n) -> _n.join('/')
        expect(_.difference(e, n)).toEqual([])

    describe '#turn', ->
      describe 'with a living cell on 0/0', ->
        it 'the new field is empty', ->
          @game.field['0/0'] = [0, 0]
          @game.turn()
          expect(@game.cells()).toEqual([])

    describe '#play', ->
      it 'plays', ->
        @game.field['0/0'] = [0, 0]
        @game.field['1/0'] = [1, 0]
        @game.field['0/1'] = [0, 1]
        @game.field['1/1'] = [1, 1]

        @game.field['2/2'] = [2, 2]
        @game.field['2/3'] = [2, 3]
        @game.field['3/2'] = [3, 2]
        @game.field['3/3'] = [3, 3]
        @game.play()
