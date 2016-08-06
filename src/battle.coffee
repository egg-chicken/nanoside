Stage = require('./stage')
Background = require('./background')
Board = require('./board')
Caption = require('./caption')
CharacterFactory = require('./character_factory')
CharacterPreset = require('./character_preset')
Strategy = require('grid').Strategy

module.exports = class Battle
  constructor: ->
    @stage = new Stage()
    @stage.add(@_initBackground())
    @stage.add(@_initBoard())
    @stage.add(@_initCaption())
    @stage.update()
    @stage.turnLoop()
    @caption.on('complete', => @_init_turn())
    @caption.play('BATTLE')

  _init_turn: ->
    @stage.on 'turn', =>
      @board.each (_, point) =>
        action = @strategy.aggressive(point)
        @board.command(point, action) if action

  _initBoard: ->
    @board = new Board()
    @strategy = new Strategy(@board)
    friends = new CharacterPreset(teamCode: 1)
    enemies = new CharacterPreset(teamCode: 2)
    for i in [0...10]
      friends.add(x: i, y: i, CharacterFactory.create(0))
      enemies.add(x: i, y: i, CharacterFactory.create(1))
    friends.apply(@board)
    enemies.apply(@board, x: 20, y: 0)
    @board

  _initBackground: ->
    new Background(color: '#000', alpha: 0.5)

  _initCaption: ->
    @caption = new Caption()
