Config = require('./config')

module.exports = class Stage
  constructor: ->
    canvas = document.getElementById(Config.CANVAS_ID)
    @stage = new createjs.Stage(canvas)
    @_fullsize(canvas)

  add: (rect)->
    @stage.addChild(rect.getShape())

  update: ->
    @stage.update()

  frameLoop: (f)->
    tick = =>
      f?()
      @stage.update()
    createjs.Ticker.framerate = Config.FPS
    createjs.Ticker.addEventListener("tick", tick)

  _fullsize: (canvas)->
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight
