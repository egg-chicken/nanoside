Stage = require('./stage')
Rect = require('./rect')
Background = require('./background')
CharacterFactory = require('./character_factory')
Board = require('./board')
Point = require('grid').Point
Strategy = require('grid').Strategy

class Nanoside
  constructor: ->
    @stage = new Stage()
    @_init_background()
    @_init_test_characters()
    @stage.update()
    @stage.turnLoop =>
      @board.each (_, point) =>
        action = @strategy.aggressive(point)
        @board.command(point, action) if action

  _init_test_characters: ->
    @board = new Board()
    @strategy = new Strategy(@board)
    for i in [0...10]
      @board.setRandomPosition(CharacterFactory.create(0, teamCode: 1))
      @board.setRandomPosition(CharacterFactory.create(1, teamCode: 2))
    @stage.add(@board)

  _init_background: ->
    background = new Background()
    @stage.add(background)

module.exports = new Nanoside()
