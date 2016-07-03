Stage = require('./stage')
Rect = require('./rect')
Background = require('./background')
Board = require('./board')
Caption = require('./caption')
CharacterFactory = require('./character_factory')
CharacterPreset = require('./character_preset')
Strategy = require('grid').Strategy


class Nanoside
  constructor: ->
    @stage = new Stage()
    @_init_background()
    @_init_test_characters()
    @_init_caption()
    @stage.update()
    @stage.turnLoop()
    @caption.on('complete', => @_init_turn())
    @caption.play('GAME START')

  _init_turn: ->
    @stage.on 'turn', =>
      @board.each (_, point) =>
        action = @strategy.aggressive(point)
        @board.command(point, action) if action

  _init_test_characters: ->
    @board = new Board()
    @strategy = new Strategy(@board)
    friends = new CharacterPreset(teamCode: 1)
    enemies = new CharacterPreset(teamCode: 2)
    for i in [0...10]
      friends.add(x: i, y: i, CharacterFactory.create(0))
      enemies.add(x: i, y: i, CharacterFactory.create(1))
    friends.apply(@board)
    enemies.apply(@board, x: 20, y: 0)
    @stage.add(@board)

  _init_background: ->
    background = new Background()
    @stage.add(background)

  _init_caption: ->
    @caption = new Caption()
    @stage.add(@caption)

module.exports = new Nanoside()
