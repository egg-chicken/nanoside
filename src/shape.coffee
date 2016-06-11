Config = require('./config')

module.exports = {
  setPosition: (position)->
    @position = position
    @shape.x = position.x * Config.CELL_WIDTH
    @shape.y = position.y * Config.CELL_WIDTH

  getPosition: ->
    @position

  getShape: ->
    @shape

  up:    -> @tweenPosition(@position.up())
  down:  -> @tweenPosition(@position.down())
  left:  -> @tweenPosition(@position.left())
  right: -> @tweenPosition(@position.right())
}
