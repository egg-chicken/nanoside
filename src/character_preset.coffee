Point = require('grid').Point

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
