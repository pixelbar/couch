class Meteor.App.Views.Mutations.Edit extends Meteor.View
  template: 'mutation_item_edit'

  events:
  	'click .cancel': 'cancelEdit'
  	'click .save': 'save'

  templateHelpers:
    getDate: -> 
      moment(@date).calendar()

    getStatus: ->
      if @approved
        'approved'
      else
        'pending'

  cancelEdit: (e, t) ->
  	e.preventDefault()
  	Meteor.App.router.navigate('/', {trigger: true})

  save: (e, t) ->
  	e.preventDefault()
  	Meteor.Store.Mutations.update({_id: t.data._id}, {
  		$set:
  			'amount': parseInt($(t.find('.amount')).val())
  			'description': $(t.find('.description')).val()
  	})

  	Meteor.App.router.navigate('/', {trigger: true})