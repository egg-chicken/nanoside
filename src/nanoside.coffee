Stage = require('./stage')
Rect = require('./rect')
Background = require('./background')
Character = require('./character')
Board = require('./board')
Point = require('grid').Point
Strategy = require('grid').Strategy

class Nanoside
  constructor: ->
    @stage = new Stage()
    @_init_background()
    @_init_test_rect()
    @_init_test_characters()
    @stage.update()
    @stage.turnLoop =>
      @board.each (_, point) =>
        action = @strategy.plan(point)
        @board.command(point, action) if action

  _init_test_characters: ->
    @board = new Board()
    @strategy = new Strategy(@board)
    for i in [0...10]
      @board.setRandomPosition(new Character())
    @stage.add(@board)

  _init_test_rect: ->
    rect = new Rect("#BBBBBB")
    @stage.add(rect)

  _init_background: ->
    background = new Background()
    @stage.add(background)

module.exports = new Nanoside()
