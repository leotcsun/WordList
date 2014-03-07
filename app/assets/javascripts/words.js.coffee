# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
    $(".word-spelling").click (e) ->
        console.log(this)
        index = $(this).attr("data-index")
        $("#word-definition-" + index).toggle()
