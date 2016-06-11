Config = require('./config')

module.exports = class Rect
  constructor: (image_or_color)->
    @shape = new createjs.Shape()
    @image = document.getElementById(image_or_color)
    @color = image_or_color unless @image
    @_fill().drawRect(0, 0, Config.CELL_WIDTH, Config.CELL_WIDTH)

  setPosition: (p)->
    @position = p
    @shape.x = p.x * Config.CELL_WIDTH
    @shape.y = p.y * Config.CELL_WIDTH

  getPosition: ->
    @position

  getShape: ->
    @shape

  up: -> @setPosition(@position.up())
  down: -> @setPosition(@position.down())
  left: -> @setPosition(@position.left())
  right: -> @setPosition(@position.right())

  _fill: ->
    if @image
      @shape.graphics.beginBitmapFill(@image)
    else
      @shape.graphics.beginFill(@color)
