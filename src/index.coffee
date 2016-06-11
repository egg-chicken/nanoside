document.addEventListener "DOMContentLoaded", ->
  Stage = require('./stage')
  Rect = require('./rect')
  Character = require('./character')

  characters = []
  for i in [0...40]
    characters[i] = new Character("#ff0000")
    characters[i].setPosition(x: i, y: 0)

  stage = new Stage()
  for i in [0...40]
    stage.add(characters[i])
  stage.frameLoop()
