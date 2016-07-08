Stage = require('./stage')
Selection = require('./selection')
Background = require('./background')
Buttle = require('./buttle')

class Nanoside
  constructor: ->
    @stage = new Stage()
    @stage.update()
    @stage.frameLoop()
    @stage.add(@_initBackground())
    @stage.add(@_initSelection())
    @selection.play()

  _initBackground: ->
    @background = new Background('#000')

  _initSelection: ->
    @selection = new Selection(["shop", "buttle"])
    @selection.on 'select', (selected) =>
      switch selected
        when 'buttle' then new Buttle()
      @stage.removeAll()
    @selection

module.exports = new Nanoside()
