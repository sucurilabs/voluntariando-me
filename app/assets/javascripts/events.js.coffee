# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

eventToggle = (url, method) =>
  $.ajax({url: url, type: method, success: (data) => 
    $("#message").html(data.message)
    $("#join_buttons").html(data.html)
  })

window["eventToggle"] = eventToggle