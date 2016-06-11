document.addEventListener "DOMContentLoaded", ->
  Stage = require('./stage')
  Rect = require('./rect')
  Character = require('./character')
  Point = require('grid').Point

  characters = []
  for i in [0...40]
    characters[i] = new Character("#ff0000")
    characters[i].setPosition(new Point(i, 0))

  stage = new Stage()
  for i in [0...40]
    stage.add(characters[i])
  stage.frameLoop()
