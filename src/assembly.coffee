Stage = require('./stage')
Background = require('./background')
Caption = require('./caption')

module.exports = class Assembly
  constructor: ->
    @stage = new Stage()
    @stage.update()
    @stage.turnLoop()
    @_init_background()
    @_init_caption()
    @caption.play('ASSEMBLY')

  _init_caption: ->
    @caption = new Caption()
    @stage.add(@caption)

  _init_background: ->
    background = new Background(color: '#F00', alpha: 0.25)
    @stage.add(background)
