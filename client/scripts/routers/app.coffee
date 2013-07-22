class Meteor.App.Routers.App extends Backbone.Router
	routes:
		'': 'home'
		'users': 'users'
		'users/:id/edit': 'editUser'

	home: ->
		index = new Meteor.App.Views.Mutations.Index(mutations: Meteor.Store.Mutations)
		$('.main').html index.render().el

		create = new Meteor.App.Views.Mutations.Create()
		$('.create-mutation').html create.render().el

	users: ->
		index = new Meteor.App.Views.Users.Index(users: Meteor.users)
		$('.main').html index.render().el

	editUser: (id) ->
		index = new Meteor.App.Views.Users.Index(users: Meteor.users)
		$('.main').html index.render().el
		
		edit 	= new Meteor.App.Views.Users.Edit(Meteor.users.findOne({_id: id}))
		$("[data-user=#{id}]").replaceWith edit.render().el