# Search box
jQuery ->
  $("input.search-input").focus ->
    if $(this).val() == $("input.search-input-prompt").val()
      $(this).val('')
  $("input.search-input").blur ->
    if $(this).val() == ""
      $(this).val($("input.search-input-prompt").val())
