Button = require('./button')

module.exports = class Selection

  constructor: (messages = ["YES", "NO"]) ->
    @container = new createjs.Container()
    @container.name = 'selection.container'
    @_initButton(messages)

  getShape: ->
    @container

  on: (event, f) ->
    switch event
      when 'select' then @onSelect = f

  play: ->
    for button in @buttons
      button.play()

  _initButton: (messages)->
    count = 0
    @buttons = messages.map((message) -> new Button(message))
    for button in @buttons
      button.on('click', (b) => @_onClick(b))
      buttonShape = button.getShape()
      buttonShape.y = count * button.getHeight()
      @container.addChild(buttonShape)
      count += 1

  _onClick: (clickedButton) ->
    @onSelect?(clickedButton.getText())
    for button in @buttons
      if clickedButton == button
        button.hideStatic()
      else
        button.hide()
