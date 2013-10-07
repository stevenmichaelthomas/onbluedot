@Carousel = class Carousel

  duration: 6000

  constructor: ->
    @$carouselItems = $(".carousel-images").children()
    @$navLinks = $(".carousel-nav").children()
    @$arrowLeft = $(".carousel-arrow-left")
    @$arrowRight = $(".carousel-arrow-right")

    @$navLinks.on("click", @_onClick)
    @$arrowLeft.on("click", @_arrowPrev)
    @$arrowRight.on("click", @_arrowNext)

    @currentIndex = 0
    @carouselSize = @$navLinks.size()

  start: =>
    @_goToState(@currentIndex)
    @timeout = setTimeout(@loop, @duration)

  loop: =>
    @next()
    @timeout = setTimeout(@loop, @duration)

  stop: ->
    window.clearTimeout(@timeout)

  prev: =>
    if @currentIndex - 1 < 0
      @currentIndex = @carouselSize
    @currentIndex = (@currentIndex - 1) % @carouselSize
    @_goToState(@currentIndex)

  next: =>
    @currentIndex = (@currentIndex + 1) % @carouselSize
    @_goToState(@currentIndex)

  _arrowPrev: (e) =>
    @stop()
    @prev()
    false

  _arrowNext: (e) =>
    @stop()
    @next()
    false

  _onClick: (e) =>
    if state = e.currentTarget.getAttribute("data-state")
      @currentIndex = ~~parseInt(state, 10)
      @_goToState(@currentIndex)
      @stop()

  _goToState: (index) ->
    @$navLinks.removeClass("active")
    @$carouselItems.removeClass("active")

    for link, i in @$navLinks
      state = ~~parseInt(link.getAttribute("data-state"), 10)
      if state == index
        @$carouselItems.eq(i).addClass("active")
        @$navLinks.eq(i).addClass("active")
