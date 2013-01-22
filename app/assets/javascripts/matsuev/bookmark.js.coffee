jQuery ->
  $(".add_to_bookmarks").on 'click', (a) ->
    title = document.title 
    url = document.location
    try 
      window.external.AddFavorite(url, title)
    catch e
      try
        window.sidebar.addPanel(title, url, "")
      catch e
        if typeof(opera) == "object"
          a.rel = "sidebar"
          a.title = title
          a.url = url
          true
        else 
          alert('To add this page to bookmarks, press Ctrl+D')
    false