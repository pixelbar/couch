class Meteor.App.Routers.App extends Backbone.Router
	routes:
		'': 'home'
		'mutations/:id/edit': 'editMutation'
		'users': 'users'
		'users/:id/edit': 'editUser'

	home: ->
		@setActiveItem('mutations')
		index = new Meteor.App.Views.Mutations.Index(mutations: Meteor.Store.Mutations)
		$('.main').html index.render().el

		create = new Meteor.App.Views.Mutations.Create()
		$('.create-mutation').html create.render().el

	editMutation: (id) ->
		@setActiveItem('mutations')
		index = new Meteor.App.Views.Mutations.Index(mutations: Meteor.Store.Mutations)
		$('.main').html index.render().el

		edit 	= new Meteor.App.Views.Mutations.Edit(Meteor.Store.Mutations.findOne({_id: id}))
		$("[data-mutation=#{id}]").replaceWith edit.render().el

		create = new Meteor.App.Views.Mutations.Create()
		$('.create-mutation').html create.render().el

	users: ->
		@setActiveItem('users')
		index = new Meteor.App.Views.Users.Index(users: Meteor.users)
		$('.main').html index.render().el

	editUser: (id) ->
		@setActiveItem('users')
		index = new Meteor.App.Views.Users.Index(users: Meteor.users)
		$('.main').html index.render().el
		
		edit 	= new Meteor.App.Views.Users.Edit(Meteor.users.findOne({_id: id}))
		$("[data-user=#{id}]").replaceWith edit.render().el

	setActiveItem: (item) ->
		$('.nav li').removeClass('active')
		$(".nav li.#{item}").addClass('active')