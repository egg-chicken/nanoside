Config = require('./config')

module.exports = class Text
  constructor: (options)->
    @text = new createjs.Text()
    @text.set
      text: options.body
      color: options.color || '#fff'
      x: options.x * Config.CELL_WIDTH || 0
      y: options.y * Config.CELL_WIDTH || 0
      font: "#{Config.Font.MIDDLE_SIZE} #{Config.Font.FAMILY}"

  getShape: ->
    @text
