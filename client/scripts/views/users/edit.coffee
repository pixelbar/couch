class Meteor.App.Views.Users.Edit extends Meteor.View
  template: 'user_item_edit'

  events:
  	'click .cancel': 'cancelEdit'
  	'click .save': 'save'

  templateHelpers:
  	credit: -> @profile.start-@profile.spent

  cancelEdit: (e, t) ->
  	e.preventDefault()
  	Meteor.App.router.navigate('/users', {trigger: true})

  save: (e, t) ->
  	e.preventDefault()
  	Meteor.users.update({_id: t.data._id}, {
  		$set:
  			'profile.start': parseInt($(t.find('.input_start')).val())
  			'profile.spent': parseInt($(t.find('.input_spent')).val())
  	})

  	Meteor.App.router.navigate('/users', {trigger: true})