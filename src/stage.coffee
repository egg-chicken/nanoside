Config = require('./config')

module.exports = class Stage
  constructor: ->
    canvas = document.getElementById(Config.CANVAS_ID)
    @stage = new createjs.Stage(canvas)
    @stage.name = "stage"
    @stage.enableMouseOver()
    @_boardsize(canvas)

  add: (rect)->
    if Array.isArray(rect)
      for i in rect
        @stage.addChild(i.getShape())
    else
      @stage.addChild(rect.getShape())

  removeAll: ->
    @stage.removeAllChildren()

  update: ->
    @stage.update()

  frameLoop: (f) ->
    tick = =>
      try
        f?()
      catch e
        console.error(e.stack)
        @_stop()
      finally
        @stage.update()
    createjs.Ticker.framerate = Config.FRAME_PER_SECOND
    createjs.Ticker.addEventListener("tick", tick)

  turnLoop: ->
    timer = 0
    @frameLoop =>
      timer += 1
      if timer >= Config.FRAME_PER_TURN
        timer = 0
        @turn?()

  on: (event, f)->
    switch event
      when 'turn' then @turn = f

  # デバッグ用に stage に属する DisplayObject を出力する
  getDisplayObjects: (current = @stage)->
    result = [current]
    if current.children
      for child in current.children
        result.push.apply(result, @getDisplayObjects(child))
    result

  getDisplayObjectNames: (root)->
    @getDisplayObjects(root).map((o) -> o.name || o.id )

  _stop: ->
    createjs.Ticker.removeAllEventListeners("tick")

  _fullsize: (canvas)->
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight

  _boardsize: (canvas)->
    canvas.width = Config.BOARD_WIDTH * Config.CELL_WIDTH
    canvas.height = Config.BOARD_HEIGHT * Config.CELL_WIDTH
