Battle = require('./battle')

class Nanoside
  constructor: ->
    @battle = new Battle()

module.exports = new Nanoside()
