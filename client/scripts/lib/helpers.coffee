# Helper classes
class Meteor.View
  constructor: ->
    # set template
    @_options           or= {}
    @_options.template  = @template
    @template           = Template[@template]

    # set callbacks
    _this = this
    @template.rendered  = ->
      _this.onRender?.apply(_this, arguments)
    @template.created   = -> 
      _this.onCreate?.apply(_this, arguments)
    @template.destroyed = -> 
      _this.onClose?.apply(_this, arguments)

    # set events
    @_setEvents()
    @_setHelpers()

    @args = Array::slice.apply(arguments)
    @initialize?.apply(this, @args)

  render: ->
    @el  = Meteor.render => @template.apply(this, @args)
    return @

  _setEvents: ->
    eventsMap     = {}
    @_mappedEvents = _.toArray(@events)
    @_methodCalled = 0

    eventsMap[e] = _.bind(@[@events[e]], this) for e of @events
    @template.events(eventsMap)

  _setHelpers: ->
    _this = this
    for helper of @templateHelpers
      @template[helper] = @templateHelpers[helper]

class Meteor.CollectionView extends Meteor.View
  constructor: ->
    @args = Array::slice.apply(arguments)

    @_options or= {}
    @_setItemView()
    super

  _setItemView: ->
    @_options.itemView  = new @itemView(@args[0])

    _this = @_options.itemView
    @_options.itemView.rendered  = ->
      _this.onRender?.apply(_this, arguments)
    @_options.itemView.created   = -> 
      _this.onCreate?.apply(_this, arguments)
    @_options.itemView.destroyed = -> 
      _this.onClose?.apply(_this, arguments)


