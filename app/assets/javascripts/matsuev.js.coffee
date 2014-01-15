//= require modernizr
//= require jquery
//= require_tree ./matsuev
//= require chosen-jquery
//= require jquery.lightbox-0.5
//= require fancybox
//= require jquery_cookie
//= require fotorama
//= require audiojs/audio.min
//= require jcarousellite_1.0.1.min

jQuery ->
  $(".video-js").each (video) ->
    jsPlayer = _V_(this.id)
    played = false
    countPlaying = ->
      _gaq.push(['_trackEvent', 'Videos', 'Play']) unless played
      played = true
    jsPlayer.addEvent("play", countPlaying)

  $("body").on 'click', 'a.next_page', (e) ->
    $(this).parent().addClass("loading")
    el = $(this)
    if $(this).attr("href").search("/blog/more") == 0
      url = $(this).attr("href")
      console.log url
    else if $(this).attr("href").search("/media/press") == 0 or $(this).attr("href").search("/media/press/more") == 0
      url = $(this).attr("href").replace("/media/press?", "/media/press/more?")
      console.log(url)
    else
      url = "/blog/more" + $(this).attr("href")
      console.log url
    $.ajax({
      url: url,
      success: (data) ->
        el.parent().before(data)
        el.parent().remove()
        $(".next_page").each(
          ->
            if $(this).hasClass("disabled") then $(this).parent().hide()
        )
    })
    e.preventDefault()

  $(".ajax-pagination").each(
    ->
      if $(this).find(".next_page").attr("href") == undefined
        $(this).hide()
  )

  $("section.photo div.photo").jCarouselLite({
    btnNext: "section.photo .arr.next"
    btnPrev: "section.photo .arr.prev"
    visible: 8
    scroll: 3
  })
