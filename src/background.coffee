Config = require('./config')

module.exports = class Background
  constructor: (options = {}) ->
    @container = new createjs.Container()
    @container.addChild(@_initBase(options))
    @container.addChild(@_initGrid(options))

  getShape: ->
    @container

  _initBase: (options) ->
    if options.color
      width = Config.BOARD_WIDTH * Config.CELL_WIDTH
      height = Config.BOARD_HEIGHT * Config.CELL_WIDTH
      shape = new createjs.Shape()
      shape.graphics.beginFill(options.color).drawRect(0, 0, width, height)
      shape.alpha = options.alpha || 1
      shape
    else if options.image
      new createjs.Bitmap(Config.Background[options.image])
    else
      new createjs.Shape()

  _initGrid: (options) ->
    return new createjs.Shape() unless options.grid
    grid = new createjs.Shape()
    grid.graphics
      .setStrokeStyle(2, 'square')
      .beginStroke(Config.Background.GRID_COLOR)
    @_drawHorizontal(grid)
    @_drawVertical(grid)
    grid.graphics.endStroke()
    grid

  _drawHorizontal: (grid) ->
    for i in [0..Config.BOARD_HEIGHT]
      h = i * Config.CELL_WIDTH
      l = Config.BOARD_WIDTH * Config.CELL_WIDTH
      grid.graphics.moveTo(0, h).lineTo(l, h)

  _drawVertical: (grid) ->
    for j in [0..Config.BOARD_WIDTH]
      w = j * Config.CELL_WIDTH
      l = Config.BOARD_HEIGHT * Config.CELL_WIDTH
      grid.graphics.moveTo(w, 0).lineTo(w, l)
