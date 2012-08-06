# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

eventToggle = (url, method) =>
  $.ajax({url: url, type: method, success: (data) => 
    $("#message").html(data.message)
    $("#join_buttons").html(data.html)
  })

moreNeed = (url) =>
  $.ajax({
    url: url, 
    success: (data) =>
      $("#needs").append(data)
  })

removeNeed = (element, url) =>
  element_parent = $(element).parent().parent()
  element_parent.find(".destroy_field").val(1)
  element_parent.hide()
  if $("#needs").find("tr:visible").length <= 0
    moreNeed(url)

window["moreNeed"] = moreNeed
window["removeNeed"] = removeNeed
window["eventToggle"] = eventToggle