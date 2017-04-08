# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#goRight').on 'click', ->
    $('#slideBox').animate 'marginLeft': '0'
    $('.topLayer').animate 'marginLeft': '100%'
    return
  $('#goLeft').on 'click', ->
    $('#slideBox').animate 'marginLeft': '50%'
    $('.topLayer').animate 'marginLeft': '0'
    return
  return