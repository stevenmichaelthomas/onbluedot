$(".contact-form").on "submit", (event) ->
  event.preventDefault()
  $form = $(this)
  $.ajax('http://onbluedot-website-service.herokuapp.com/contact', data: $form.serialize(), type: 'POST')
    .done((resp) ->
      $("#contact").addClass("success")

      return
    )
    .fail((xhr) ->
      console.log xhr
      return
    )
  return
