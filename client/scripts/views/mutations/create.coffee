class Meteor.App.Views.Mutations.Create extends Meteor.View
  template: 'create_mutation'
  events:
    'click button': 'submit'

  initialize: ->

  submit: (e, t) ->
    e.preventDefault()
    description = $(t.find('.description'))
    amount			= $(t.find('.amount'))

    doc         =
      description: description.val()
      amount: amount.val()
      status: 'pending'

    Meteor.Store.Mutations.insert(doc)
    
    description.val('')
    amount.val('')

