class Meteor.App.Views.Mutations.Index extends Meteor.CollectionView
  template: 'mutations'
  itemView: Meteor.App.Views.Mutations.Item

  initialize: (@options = {}) ->
  	@template.mutations = => @options.mutations.find()