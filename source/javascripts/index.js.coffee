featuredProjectsCarousel = new Carousel()
featuredProjectsCarousel.start()

$ ->
  height = window.outerHeight - 78
  $(".hero").css("height", height)
