jQuery ->
  $(".filter.date select").live 'change', (e) ->
    if $(this).val() == "" && $(".filter.city select").val() == ""
      window.location.href = window.location.pathname
    else if $(this).val() == ""
      window.location.href = "?city=" + $(".filter.city select").val()
    else if $(".filter.city select").val() == ""
      window.location.href = "?date=" + $(this).val()
    else
      window.location.href = "?city=" + $(".filter.city select").val() + "&date=" + $(this).val()

  $(".filter.city select").live 'change', (e) ->
    if $(this).val() == "" && $(".filter.date select").val() == ""
      window.location.href = window.location.pathname
    else if $(this).val() == ""
      window.location.href = "?date=" + $(".filter.date select").val()
    else if $(".filter.date select").val() == ""
      window.location.href = "?city=" + $(this).val()
    else
      window.location.href = "?date=" + $(".filter.date select").val() + "&city=" + $(this).val()

  $(".filter.date select").chosen()
  $(".filter.city select").chosen()

  $(".calendar span.arr.prev").live 'click', (e) ->
    $.ajax({
      url: "/concerts/load/prev?month=" + $(this).next().data("month"),
      success: (data) ->
        $(".calendar span.arr.prev").after(data)
        $(".calendar span.arr.next").prev().remove()
        $(".calendar span.arr.prev").addClass("disabled") if $(data).data("empty") == "prev"
        $(".calendar span.arr.next").removeClass("disabled")
        setActiveMonth()
    })
    false

  $(".calendar span.arr.next").live 'click', (e) ->
    $.ajax({
      url: "/concerts/load/next?month=" + $(this).prev().data("month"),
      success: (data) ->
        $(".calendar span.arr.next").before(data)
        $(".calendar span.arr.prev").next().remove()
        $(".calendar span.arr.next").addClass("disabled") if $(data).data("empty") == "next"
        $(".calendar span.arr.prev").removeClass("disabled")
        setActiveMonth()
    })
    false

  $(".calendar-toggle").live 'click', (e) ->
    if $(this).next().css("display") == "none"
      $.cookie("calendar", "on")
    else
      $.cookie("calendar", "off")
    $(this).next().fadeToggle(100)
    false

  if $.cookie("calendar") == "on"
    $(".calendar-toggle").next().show(0)

  setActiveMonth = ->
    months = []
    $("#calend ul.months > li").each (month) ->
      months.push $(this).data("month")

    $(".calendar.widget nav > div").each (div) ->
      $(this).addClass("active") if $(this).data("month") in months

  setActiveMonth()


