# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
dialog = document.querySelector('dialog')
showDialogButton = document.querySelector('#show-dialog')
if !dialog.showModal
  dialogPolyfill.registerDialog dialog
showDialogButton.addEventListener 'click', ->
  dialog.showModal()
  return
dialog.querySelector('.close').addEventListener 'click', ->
  dialog.close()
  return