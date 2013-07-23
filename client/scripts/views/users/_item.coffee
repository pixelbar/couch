class Meteor.App.Views.Users.Item extends Meteor.View
  template: 'user_item'

  events:
  	'click .edit': 'editPerson'

  templateHelpers:
  	credit: -> @profile.start-@profile.spent
  	isAdmin: ->
  		if @services?.github?.username is 'davidvanleeuwen'
  			true
  		else
  			false
  	getStart: -> @profile.start
  	getSpent: -> @profile.spent

  editPerson: (e, t) ->
  	e.preventDefault()
  	Meteor.App.router.navigate("/users/#{t.data._id}/edit", {trigger: true})