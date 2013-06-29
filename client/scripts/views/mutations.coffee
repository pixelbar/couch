class Meteor.App.Views.Mutations extends Meteor.View
  template: 'create_mutation'
  events:
    'click h3': 'clickHandler'

  initialize: ->
    console.log 'yay'

  clickHandler: (e) ->
    e.preventDefault()