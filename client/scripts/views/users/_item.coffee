class Meteor.App.Views.Users.Item extends Meteor.View
  template: 'user_item'

  templateHelpers:
  	credit: -> @profile.start-@profile.spent
  	isAdmin: ->
  		if @services?.github?.username is 'davidvanleeuwen'
  			true
  		else
  			false