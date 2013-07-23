class Meteor.App.Views.Mutations.Item extends Meteor.View
  template: 'mutation_item'

  templateHelpers:
  	getDate: -> 
      moment(@date).calendar()

    getStatus: ->
      if @approved
        'approved'
      else
        'pending'

    shouldApprove: ->
      if Meteor.user()._id isnt @user_id and !@approved
        true
      else
        false

    canEdit: ->
      if Meteor.user()._id is @user_id
        true
      else
        false

    isAdmin: ->
      if Meteor.user().services?.github?.username is 'davidvanleeuwen' and Meteor.user()._id isnt @user_id
        true
      else
        false

    showReceiptOnly: ->
      if Meteor.user()._id isnt @user_id and @approved
        true
      else
        false

  events:
    'click .remove': 'remove'
    'click .open_receipt': 'openReceipt'
    'click .approve': 'approve'
    'click .edit': 'edit'

  initialize: (@options = {}) ->

  remove: (e, t) ->
    e.preventDefault()

    if t.data.approved
      user = Meteor.users.findOne({_id: t.data.user_id})
      Meteor.users.update({_id: t.data.user_id}, {
        $set:
          'profile.spent': user.profile.spent-t.data.amount
      })

    @options.mutations.remove(t.data._id)
    Meteor.Store.Receipts.remove(t.data.file)

  approve: (e, t) ->
    e.preventDefault()

    Meteor.users.update({_id: t.data.user_id}, {
      $inc:
        'profile.spent': t.data.amount
    })

    Meteor.Store.Mutations.update({_id: t.data._id}, {
      $set: 
        'approved': true
        'approved_by': Meteor.userId()
    })

  openReceipt: (e, t) ->
  	Meteor.Store.Receipts.retrieveBlob t.data.file, (file) ->
  		
    binary 	= ''
    bytes 	= file.queueChunks[0]
    for i in [0..bytes.byteLength]
    	binary += String.fromCharCode(bytes[i])
    	
    window.open("data:image/png;base64,#{btoa(binary)}")

  edit: (e, t) ->
    e.preventDefault()
    Meteor.App.router.navigate("/mutations/#{t.data._id}/edit", {trigger: true})