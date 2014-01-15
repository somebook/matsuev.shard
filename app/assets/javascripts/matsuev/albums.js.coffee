jQuery ->
  $('.lightbox').attr('rel', 'gallery').fancybox(
    nextEffect: "fade"
    prevEffect: "fade"
    beforeShow: ->
      if $(this.element).data("description")
        this.title += $(this.element).data("description")
        this.title += "<br>"
      if $(this.element).data("author")
        this.title += "Автор: "
        this.title += $(this.element).data("author")
        this.title += "<br>"
      if $(this.element).data("original")
        this.title += "<a style='float:right; color: #333' target='_blank' href='" + $(this.element).data("original") + "'>версия для печати</a><br>"
    helpers:
      title:
        type: "inside"
  )
  # .lightBox({
  #   imageLoading:  '/assets/lightbox/lightbox-ico-loading.gif'
  #   imageBtnClose: '/assets/lightbox/lightbox-btn-close.gif'
  #   imageBtnPrev:  '/assets/lightbox/lightbox-btn-prev.gif'
  #   imageBtnNext:  '/assets/lightbox/lightbox-btn-next.gif'
  #   imageBlank:    '/assets/lightbox/lightbox-blank.gif'
  # })