Grid = require('grid')
Tween = require('./tween')
Config = require('./config')
Flag = require('./flag')

module.exports = class Character extends Grid.Piece
  @include(require('./shape'))

  constructor: (options)->
    super
    @shape = new createjs.Container()
    @sprite = new createjs.Sprite(@_createSheet(options.spriteCode), "down")
    @flag   = new Flag(@teamCode)
    @shape.addChild(@sprite)
    @shape.addChild(@flag.getShape())

  tweenPosition: (position) ->
    dir = @getPosition().where(position)
    if @currentDir != dir
      @sprite.gotoAndPlay(dir)
      @currentDir = dir
    Tween.tweenPosition.apply(@, arguments)

  damage: ->
    super
    if @isDead()
      @sprite.gotoAndPlay('defeated')

  _createSheet: (spriteCode)->
    new createjs.SpriteSheet
      images: ["#{Config.Sprite.PATH}/#{spriteCode}.png"]
      frames: { width: Config.CELL_WIDTH, height: Config.CELL_WIDTH }
      animations:
        down:      [0,   3, 'down', Config.Sprite.FRAME_SPEED]
        up:        [4,   7, 'up', Config.Sprite.FRAME_SPEED]
        left:      [8,  11, 'left', Config.Sprite.FRAME_SPEED]
        right:     [12, 15, 'right', Config.Sprite.FRAME_SPEED]
        defeated:  [16, 19, 'defeated2', Config.Sprite.FRAME_SPEED]
        defeated2: 19
