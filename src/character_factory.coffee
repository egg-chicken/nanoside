CSV = require("comma-separated-values")
Character = require('./character')

raw = require('fs').readFileSync("#{__dirname}/../data/character_master.csv", 'utf8')
MASTER = new CSV(raw, header: true).parse()

module.exports = class CharacterFactory
  @create: (index, options = {}) ->
    params = Object.assign({}, MASTER[index], options)
    new Character(params)
