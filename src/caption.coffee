Rect = require('./rect')
Config = require('./config')

module.exports = class Caption
  constructor: ->
    canvas_width = Config.BOARD_WIDTH * Config.CELL_WIDTH
    canvas_height = Config.BOARD_HEIGHT * Config.CELL_WIDTH

    @container = new createjs.Container()
    @shape = new createjs.Shape()
    @shape.graphics.beginFill("#000").drawRect(0, 0, canvas_width, canvas_height)
    @container.addChild(@shape)

  getShape: ->
    @container

  on: (event, f)->
    switch event
      when 'complete' then @onComplete = f

  play: ->
    _onComplete = =>
      @container.alpha = 1
      @container.visible = false
      @onComplete()

    createjs.Tween.get(@container)
      .to(alpha: 0, 1000)
      .call(_onComplete)
