Grid = require('grid')
Config = require('./config')

module.exports = class Board extends Grid.Board
  constructor: ->
    @shape = new createjs.Container()
    super(Config.BOARD_WIDTH, Config.BOARD_HEIGHT)

  getShape: ->
    @shape

  setRandomPosition: (character)->
    p = Grid.Point.random(Config.BOARD_WIDTH, Config.BOARD_HEIGHT)
    @set(p, character)

  set: (position, character)->
    shape = character.getShape()
    if @shape.contains(shape)
      character.tweenPosition(position)
    else
      @shape.addChild(shape)
      character.setPosition(position)
    super
