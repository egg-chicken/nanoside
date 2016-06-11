document.addEventListener "DOMContentLoaded", ->
  Stage = require('./stage')
  Rect = require('./rect')
  Background = require('./background')
  Character = require('./character')
  Point = require('grid').Point

  stage = new Stage()
  background = new Background()
  stage.add(background)
  stage.add(new Rect("#BBBBBB"))
  stage.update()

  characters = []
  for i in [0...40]
    characters[i] = new Character()
    characters[i].setPosition(new Point(i, 0))

  for i in [0...40]
    stage.add(characters[i])

  stage.turnLoop ->
    for i in [0...40]
      dirs = ["up", "down", "left", "right"]
      dir = dirs[Math.floor(Math.random() * 4)]
      characters[i][dir]()
