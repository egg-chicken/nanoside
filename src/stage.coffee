Config = require('./config')

module.exports = class Stage
  constructor: ->
    canvas = document.getElementById(Config.CANVAS_ID)
    @stage = new createjs.Stage(canvas)
    @_fullsize(canvas)
    window.addEventListener 'resize', =>
      @_fullsize(canvas)

  add: (rect)->
    @stage.addChild(rect.getShape())

  update: ->
    @stage.update()

  frameLoop: (f) ->
    tick = =>
      f?()
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

  _fullsize: (canvas)->
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
