Point = require('grid').Point
CharacterFactory = require('./character_factory')

module.exports = class CharacterPreset
  constructor: (options)->
    @teamCode = options.teamCode
    @list = {}

  add: (position, member) ->
    position = new Point(position.x, position.y)
    member.teamCode = @teamCode
    @list[member.id] = {position, member}

  remove: (member) ->
    delete @list[member.id]

  each: (f) ->
    for _key, val of @list
      f(val.position, val.member)

  apply: (board, offset) ->
    @each (position, member) ->
      position = position.shift(offset.x, offset.y) if offset
      board.set(position, member)

  # options: characterCode, teamCode
  @wing: (options) ->
    preset = new CharacterPreset(options)
    position = (i) -> {x: i, y: if options.reverse then 9-i else i }
    for i in [0...10]
      preset.add(position(i), CharacterFactory.create(options.characterCode))
    preset
