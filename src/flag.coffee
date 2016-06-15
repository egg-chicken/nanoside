Config = require('./config')
COLORS = ['#000000', '#FF0000', '#0000FF']

module.exports = class Flag
  constructor: (code)->
    @color = COLORS[code]
    @shape = new createjs.Shape()
    @_draw()

  hide: ->
    @shape.visible = false

  _draw: ->
    x = Config.CELL_WIDTH
    @shape.graphics.beginFill(@color)
      .moveTo(x/4, 0)
      .lineTo(x*3/4, 0)
      .lineTo(x/2, x/4)
      .lineTo(x/4, 0)
      .endFill()
    @shape.y = - x/2

  getShape: ->
    @shape
