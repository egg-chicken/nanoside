Config = require('./config')

TURN = Config.FRAME_PER_TURN / Config.FRAME_PER_SECOND * 1000 / 4

module.exports = {
  tweenPosition: (position)->
    @position = position
    params = {
      x: @position.x * Config.CELL_WIDTH
      y: @position.y * Config.CELL_WIDTH
    }
    createjs.Tween.get(@shape).to(params, TURN)
}
