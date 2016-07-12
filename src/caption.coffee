Rect = require('./rect')
Config = require('./config')

module.exports = class Caption
  constructor: ->
    @container = new createjs.Container()
    @container.addChild(@_initBlack())
    @container.addChild(@_initText())

  getShape: ->
    @container

  on: (event, f) ->
    switch event
      when 'complete' then @onComplete = f

  play: (message) ->
    @text.set(@_buildTextOptions(text: message))

    _onComplete = =>
      @container.alpha = 1
      @container.visible = false
      @onComplete?()

    createjs.Tween.get(@container)
      .to(alpha: 1, 1000)
      .to(alpha: 0, 1000)
      .call(_onComplete)

  _initBlack: ->
    canvasWidth = Config.BOARD_WIDTH * Config.CELL_WIDTH
    canvasHeight = Config.BOARD_HEIGHT * Config.CELL_WIDTH
    black = new createjs.Shape()
    black.graphics.beginFill('#000').drawRect(0, 0, canvasWidth, canvasHeight)
    black

  _initText: ->
    @text = new createjs.Text()

  _buildTextOptions: (options)->
    base =
      y: (Config.BOARD_HEIGHT * Config.CELL_WIDTH)/2
      x: (Config.BOARD_WIDTH * Config.CELL_WIDTH)/2
      textAlign: 'center'
      textBaseline: 'middle'
      color: '#fff'
      font: "#{Config.Font.MIDDLE_SIZE} #{Config.Font.FAMILY}"
    Object.assign(base, options)
