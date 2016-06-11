Config = require('./config')

module.exports = class Background
  constructor: ->
    @shape = new createjs.Shape()
    @_drawLine()

  getShape: ->
    @shape

  _drawLine: ->
    @shape.graphics.beginStroke("#AAAAAA")
    @_drawHorizontal()
    @_drawVertical()
    @shape.graphics.endStroke()

  _drawHorizontal: ->
    for i in [0...Config.BOARD_HEIGHT]
      h = i * Config.CELL_WIDTH
      l = Config.BOARD_WIDTH * Config.CELL_WIDTH
      @shape.graphics.moveTo(0, h).lineTo(l, h)

  _drawVertical: ->
    for j in [0...Config.BOARD_WIDTH]
      w = j * Config.CELL_WIDTH
      l = Config.BOARD_HEIGHT * Config.CELL_WIDTH
      @shape.graphics.moveTo(w, 0).lineTo(w, l)
