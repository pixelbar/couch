class Meteor.App.Views.Users.Index extends Meteor.CollectionView
  template: 'users'
  itemView: Meteor.App.Views.Users.Item

  initialize: (@options = {}) ->
  	@template.users = => @options.users.find()