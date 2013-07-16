class Meteor.App.Views.Mutations.Create extends Meteor.View
  template: 'create_mutation'
  events:
    'click button': 'submit'

  initialize: ->

  submit: (e, t) ->
    e.preventDefault()
    description = $(t.find('.description'))
    amount			= $(t.find('.amount'))

    Meteor.Store.Mutations.insert {description: description.val(), amount: amount.val()}
    
    description.val('')
    amount.val('')

