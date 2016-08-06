Stage = require('./stage')
Background = require('./background')
Board = require('./board')
Caption = require('./caption')
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
    @caption.play('nanoside')

  _init_turn: ->
    @stage.on 'turn', =>
      @board.each (_, point) =>
        action = @strategy.aggressive(point)
        @board.command(point, action) if action

  _initBoard: ->
    @board = new Board()
    @strategy = new Strategy(@board)
    friends = CharacterPreset.wing(teamCode: 1, characterCode: 0)
    enemies = CharacterPreset.wing(teamCode: 2, characterCode: 1, reverse: true)
    friends.apply(@board)
    enemies.apply(@board, x: 20, y: 0)
    @board

  _initBackground: ->
    new Background(color: '#000', alpha: 0.5)

  _initCaption: ->
    @caption = new Caption()
