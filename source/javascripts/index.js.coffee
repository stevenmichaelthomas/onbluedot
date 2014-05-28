#= require sticky_spy
#= require lib/d3.min
#= require stars

$ ->
  $('textarea').autosize()
  $("body").stickySpy()

  stars = new Stars(document.getElementById('stars'))
  stars.render()
