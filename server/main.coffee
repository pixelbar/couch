Meteor.publish 'mutations', ->
	Mutations.find()

# not working?!?
Accounts.onCreateUser (options, user) ->
	options.profile.start = 0
	options.profile.spent = 0

	user.profile = options.profile if options.profile
	return user


# console.log Meteor.users.find()
# Meteor.users.remove(Meteor.users.findOne()._id)
	
# Meteor.Store.Receipts.filter
# 	allow:
# 		contentTypes: ['image/*']