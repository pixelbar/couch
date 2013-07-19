Meteor.startup ->
	Meteor.App.router = new Meteor.App.Routers.App()
	Backbone.history.start(pushState: true)