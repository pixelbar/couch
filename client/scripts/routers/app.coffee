class Meteor.App.Routers.App extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    view = new Meteor.App.Views.Mutations()
    console.log view.render().$el
    $('.create-mutation').html view.render().$el