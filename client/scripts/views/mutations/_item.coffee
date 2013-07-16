class Meteor.App.Views.Mutations.Item extends Meteor.View
  template: 'mutation_item'

  events:
  	'click td': 'remove'

  initialize: (@options = {}) ->

  remove: (e, t) ->
  	@options.mutations.remove(t.data._id)
