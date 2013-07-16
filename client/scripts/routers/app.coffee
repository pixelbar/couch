class Meteor.App.Routers.App extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    index = new Meteor.App.Views.Mutations.Index(mutations: Meteor.Store.Mutations)
    $('.container-fluid').html index.render().el

    create = new Meteor.App.Views.Mutations.Create()
    $('.create-mutation').html create.render().el