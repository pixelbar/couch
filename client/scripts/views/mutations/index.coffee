class Meteor.App.Views.Mutations.Index extends Meteor.CollectionView
  template: 'mutations'
  itemView: Meteor.App.Views.Mutations.Item

  initialize: (@options = {}) ->
  	@template.mutations = => @options.mutations.find()

  onRender: ->
  	mutations = @options.mutations.find()

  	total = 0

  	for key of mutations.collection.docs
  		doc = mutations.collection.docs[key]
	  	total -= doc.amount if doc.approved

	  $('.spent').text("€#{total*-1}")

	  users = Meteor.users.find()

	  for key of users.collection.docs
	  	doc = users.collection.docs[key]
	  	total += doc.profile?.start


  	$('.cash').text("€#{total}")