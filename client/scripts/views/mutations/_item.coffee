class Meteor.App.Views.Mutations.Item extends Meteor.View
  template: 'mutation_item'

  events:
  	'click .remove': 'remove'
  	'click .open_receipt': 'openReceipt'

  templateHelpers:
  	getDate: -> moment(@date).calendar()

  initialize: (@options = {}) ->

  remove: (e, t) ->
  	@options.mutations.remove(t.data._id)
  	Meteor.Store.Receipts.remove(t.data.file)

  openReceipt: (e, t) ->
  	Meteor.Store.Receipts.retrieveBlob t.data.file, (file) ->
  		
    binary 	= ''
    bytes 	= file.queueChunks[0]
    for i in [0..bytes.byteLength]
    	binary += String.fromCharCode(bytes[i])
    	
    window.open("data:image/png;base64,#{btoa(binary)}")