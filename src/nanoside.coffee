Stage = require('./stage')
Selection = require('./selection')
Background = require('./background')
Battle = require('./battle')
Assembly = require('./assembly')

class Nanoside
  constructor: ->
    @stage = new Stage()
    @stage.update()
    @stage.frameLoop()
    @stage.add(@_initBackground())
    @stage.add(@_initSelection())
    @selection.play()

  _initBackground: ->
    @background = new Background(color: '#000', alpha: 0.5)

  _initSelection: ->
    @selection = new Selection(["assembly", "battle"])
    @selection.on 'select', (selected) =>
      switch selected
        when 'battle'   then new Battle()
        when 'assembly' then new Assembly()
      @stage.removeAll()
    @selection

module.exports = new Nanoside()
