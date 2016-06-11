document.addEventListener "DOMContentLoaded", ->
  Stage = require('./stage')
  Rect = require('./rect')

  rect = new Rect("#ff0000")
  i = 1

  stage = new Stage()
  stage.add(rect)
  stage.frameLoop ->
    i += 1
    rect.setPosition(x: i, y: 1)
