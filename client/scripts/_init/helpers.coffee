# Helper classes

class Meteor.View
  constructor: ->
    args = Array::slice.apply(arguments)
    @initialize?.apply(this, args)

    # callbacks
    Template[@template].rendered  = @onRender if @onRender
    Template[@template].created   = @onCreate if @onCreate
    Template[@template].destroyed = @onClose if @onClose

    @_setEvents()

  render: ->
    args  = Array::slice.apply(arguments)
    @el   = Meteor.render => Template[@template].apply(this, args)
    @$el  = $(@el)

    return @

  _setEvents: ->
    eventsMap = {}
    eventsMap[e] = @[@events[e]] for e of @events
    Template[@template].events(eventsMap)