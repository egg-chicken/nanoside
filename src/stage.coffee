Config = require('./config')

module.exports = class Stage
  constructor: ->
    canvas = document.getElementById(Config.CANVAS_ID)
    @stage = new createjs.Stage(canvas)
    @_boardsize(canvas)

  add: (rect)->
    @stage.addChild(rect.getShape())

  update: ->
    @stage.update()

  frameLoop: (f) ->
    tick = =>
      try
        f?()
      catch e
        console.error(e.stack)
        @_stop()
      finally
        @stage.update()
    createjs.Ticker.framerate = Config.FRAME_PER_SECOND
    createjs.Ticker.addEventListener("tick", tick)

  turnLoop: (f) ->
    timer = 0
    @frameLoop ->
      timer += 1
      if timer >= Config.FRAME_PER_TURN
        timer = 0
        f?()

  _stop: ->
    createjs.Ticker.removeAllEventListeners("tick")

  _fullsize: (canvas)->
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight

  _boardsize: (canvas)->
    canvas.width = Config.BOARD_WIDTH * Config.CELL_WIDTH
    canvas.height = Config.BOARD_HEIGHT * Config.CELL_WIDTH
