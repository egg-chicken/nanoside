Config = require('./config')

module.exports = class Rect
  for key, val of require('./shape')
    @::[key] = val

  for key, val of require('./tween')
    @::[key] = val

  constructor: (image_or_color)->
    @shape = new createjs.Shape()
    @image = document.getElementById(image_or_color)
    @color = image_or_color unless @image
    @_fill().drawRect(0, 0, Config.CELL_WIDTH, Config.CELL_WIDTH)


  _fill: ->
    if @image
      @shape.graphics.beginBitmapFill(@image)
    else
      @shape.graphics.beginFill(@color)
