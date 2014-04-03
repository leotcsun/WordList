# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    count = 0

    $(".word-spelling").click (e) ->
        index = $(this).attr("data-index")

        word = $("#word-definition-" + index)
        counter = $("#click-counter #click")

        $("#word-definition-" + index).toggle()
        counter.text(++count) if word.is(":visible")

$(document).ready(ready)
$(document).on('page:load', ready)

