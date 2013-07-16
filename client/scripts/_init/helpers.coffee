# Helper classes

class Meteor.View
  constructor: ->
    @args = Array::slice.apply(arguments)
    @initialize?.apply(this, @args)

    # callbacks
    _this = this
    Template[@template].rendered  = ->
      _this.onRender?.apply(_this, arguments)
    Template[@template].created   = -> 
      _this.onCreate?.apply(_this, arguments)
    Template[@template].destroyed = -> 
      _this.onClose?.apply(_this, arguments)

    @_setEvents()

  render: ->
    @el  = Meteor.render => Template[@template].apply(this, @args)
    return @

  _setEvents: ->
    eventsMap = {}
    for e of @events
      eventsMap[e] = => @[@events[e]].apply(this, arguments)

    Template[@template].events(eventsMap)