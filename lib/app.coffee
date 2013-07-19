Meteor.Store  					= []

Meteor.Store.Mutations 	= new Meteor.Collection('mutations')
Meteor.Store.Receipts 	= new CollectionFS('receipts', { autopublish: false })