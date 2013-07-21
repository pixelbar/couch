class Meteor.App.Views.Mutations.Create extends Meteor.View
  template: 'create_mutation'
  events:
    'change .fileuploader': 'storeFile'
    'submit form': 'submit'

  templateHelpers:
    userLoggedIn: -> Meteor.user()

  initialize: ->

  storeFile: (e, t) ->
    e.preventDefault()

    files   = e.target.files
    @fileId =  Meteor.Store.Receipts.storeFile(files[0]) if files?.length > 0

  submit: (e, t) ->
    e.preventDefault()

    description = $(t.find('.description'))
    amount			= $(t.find('.amount'))

    if description.length > 0 and amount.length > 0 and @fileId?.length > 0
      doc       =
        description: description.val()
        amount: amount.val()
        status: 'pending'
        file: @fileId
        date: moment().format()

      Meteor.Store.Mutations.insert(doc)
      
      description.val('')
      amount.val('')

      control   = $(t.find('.fileuploader'))
      control.replaceWith(control.clone())

      @fileId = ''

