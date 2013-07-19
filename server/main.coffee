Meteor.publish 'mutations', ->
	Mutations.find()
	
# Meteor.Store.Receipts.filter
# 	allow:
# 		contentTypes: ['image/*']