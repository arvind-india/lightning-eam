Template.deleteItemPage.onRendered ->
  $(".dropdown-button").dropdown()
  $('.tooltipped').tooltip {delay: 50}

Template.deleteItemPage.onDestroyed ->
  $('.tooltipped').tooltip 'remove'

Template.deleteItemPage.helpers
  customTemplate: -> Customisations.deleteItem
  textDoc: -> (Items.findOne {'id':Session.get('currentID').toString()}).text

Template.deleteItemPage.events
  'click .deleteItem .btnDelete': (event) ->
    temp = Items.findOne {'parent':Session.get('currentID').toString()}
    if temp
      alert 'You cannot delete an item that has children!'
    else
      Meteor.call 'deleteItem', Session.get('currentID').toString(), (error, result) ->
        if error
          toast 'error', error
        else
          toast 'success', result
        return
    FlowRouter.go history.back()
