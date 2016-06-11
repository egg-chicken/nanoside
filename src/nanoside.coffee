Stage = require('./stage')
Rect = require('./rect')
Background = require('./background')
Character = require('./character')
Config = require('./config')
Point = require('grid').Point

class Nanoside
  constructor: ->
    @stage = new Stage()
    @_init_background()
    @_init_test_rect()
    @_init_test_characters()
    @stage.update()
    @stage.turnLoop =>
      for character in @characters
        dirs = ["up", "down", "left", "right"]
        dir = dirs[Math.floor(Math.random() * 4)]
        character[dir]()

  _init_test_characters: ->
    @characters = []
    for i in [0...40]
      p = Point.random(Config.BOARD_WIDTH, Config.BOARD_HEIGHT)
      @characters[i] = new Character()
      @characters[i].setPosition(p)
      @stage.add(@characters[i])

  _init_test_rect: ->
    rect = new Rect("#BBBBBB")
    @stage.add(rect)

  _init_background: ->
    background = new Background()
    @stage.add(background)

module.exports = new Nanoside()
