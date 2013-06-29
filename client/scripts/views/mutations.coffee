class Meteor.App.Views.Mutations extends Meteor.View
  template: 'create_mutation'
  events:
    'click button': 'clickHandler'

  initialize: ->
    console.log 'yay'

  clickHandler: (e) ->
    e.preventDefault()
    console.log 'w00t'