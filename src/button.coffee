Config = require('./config')

module.exports = class Button
  WIDTH = 12 * Config.CELL_WIDTH
  HEIGHT = 2 * Config.CELL_WIDTH

  constructor: (message) ->
    @container = new createjs.Container()
    @container.cursor = 'pointer'
    @container.addChild(@_initText(message))
    @container.hitArea = @_initHitBox()
    @container.alpha = 0
    @container.x = Config.CELL_WIDTH

  getShape: ->
    @container

  on: (event, f) ->
    switch event
      when 'click' then @container.addEventListener('click', f)

  play: ->
    params = { alpha: 1, x: 0 }
    createjs.Tween.get(@container).to(params, 1000, createjs.Ease.quintOut)

  hide: ->
    createjs.Tween.get(@container).to(alpha: 0, 1000, createjs.Ease.quintOut)

  _initHitBox: ->
    box = new createjs.Shape()
    box.graphics.beginFill('#000').drawRect(0, 0, WIDTH, HEIGHT)
    box

  _initText: (message)->
    @text = new createjs.Text()
    @text.set
      text: message
      x: WIDTH/2
      y: HEIGHT/2
      textAlign: 'center'
      textBaseline: 'middle'
      color: '#fff'
      font: "#{Config.CELL_WIDTH}px Courier"
    @text
