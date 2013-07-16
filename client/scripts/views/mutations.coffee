class Meteor.App.Views.Mutations.Index extends Meteor.View
  template: 'mutations'

  initialize: (@options = {}) ->
  	Template[@template].mutations = => @options.mutations.find()