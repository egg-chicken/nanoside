Stage = require('./stage')
Background = require('./background')
Caption = require('./caption')
Text = require('./text')

module.exports = class Assembly
  constructor: ->
    @stage = new Stage()
    @stage.add(@_initBackground())
    @stage.add(@_initTexts())
    @stage.add(@_initCaption())
    @stage.update()
    @stage.turnLoop()
    @caption.play('ASSEMBLY')

  _initCaption: ->
    @caption = new Caption()

  _initBackground: ->
    background = new Background(color: '#000', alpha: 0.5)

  _initTexts: ->
    [
      new Text(body: 'Assembly LV26', x: 0, y: 0),
      new Text(body: '                cost', x: 0, y: 2, color: '#999')
      new Text(body: 'Generic I       20.0', x: 0, y: 3)
      new Text(body: 'Generic I+      76.0', x: 0, y: 4)
      new Text(body: 'Generic I++    593.0', x: 0, y: 5)
      new Text(body: 'Grappler      1000.5', x: 0, y: 6)

      new Text(body: 'Disassembly LV5', x: 20, y: 0)
      new Text(body: '                gain  stock', x: 20, y: 2, color: '#999')
      new Text(body: 'Generic I       10.5      4', x: 20, y: 3)
      new Text(body: 'Generic I+      20.2      3', x: 20, y: 4)
      new Text(body: 'Generic I++    160.2      1', x: 20, y: 5)

      new Text(body: 'JUNK 5607.9', x: 50, y: 8)
    ]
