class @StickySpy extends Exo.Widget
  @name: "StickySpy"

  anchorPadding: 70

  events:
    "click .header-nav a": "_scrollToItem"

  constructor: ->
    super

    @$menu = @$el.find(".header-nav")
    @$menuItems = @$menu.find("a")
    @$scrollItems = @$menuItems.map ->
      item = $($(this).attr("href"))
      item if item.length

    $(window).on "scroll", =>
      @fromTop = $(window).scrollTop()
      @_activateCurrentItem()

  _scrollToTop: (e) ->
    e.preventDefault()
    $("html, body").stop().animate({
      scrollTop: 0
    }, 300)

  _activateCurrentItem: (e) ->
    fromTop = @fromTop

    currentItem = @$scrollItems.map ->
      this if $(this).offset().top - 72 < fromTop

    currentItem = currentItem[currentItem.length - 1]

    id = if currentItem && currentItem.length then currentItem[0].id else @$scrollItems[0].id

    if lastId != id
      lastId = id
      
      if fromTop + $(window).height() >= $(document).height() - 50
        @$menuItems.removeClass("active").last().addClass("active")
      else
        @$menuItems
          .parent().end()
          .removeClass("active").filter("[href=#"+id+"]").addClass("active")

    if fromTop < 400
      @$menuItems.removeClass("active")

  _scrollToItem: (e) ->
    e.preventDefault()
    $link = $(e.currentTarget)
    href = $link.attr("href")
    offsetTop = $(href).offset().top - @anchorPadding

    $("html, body").stop().animate({
      scrollTop: offsetTop
    }, 300)

Exo.Widget.register("stickySpy", StickySpy)
