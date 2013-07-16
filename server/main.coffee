Mutations = new Meteor.Collection("mutations")

Meteor.publish 'mutations', ->
	Mutations.find()