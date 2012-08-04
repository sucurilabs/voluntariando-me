# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () =>
  $("#select_localization").change( (e) => 
    getNeighborhoods(e.currentTarget)
  )

getNeighborhoods = (element) =>
  $.ajax($(element).data("url") + "?localization_id=" + $(element).val() , {
    success: (data) =>
      setNeighborhoods(data)
  })

setNeighborhoods = (data) =>
  $("#select_neighborhood").html('')
  for element in data
    option = "<option value='" + element.value + "'>" + element.name + "</option>"
    $("#select_neighborhood").append(option)
