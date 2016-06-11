Config = require('./config')

module.exports = class Stage
  constructor: ->
    @stage = new createjs.Stage(Config.CANVAS_ID)

  add: (rect)->
    @stage.addChild(rect.getShape())

  update: ->
    @stage.update()

  frameLoop: (f)->
    tick = =>
      f()
      @stage.update()
    createjs.Ticker.framerate = Config.FPS
    createjs.Ticker.addEventListener("tick", tick)
