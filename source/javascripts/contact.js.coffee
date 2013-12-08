$(".contact-form").on "submit", (event) ->
  event.preventDefault()
  $form = $(this)
  $.ajax('http://localhost:3000/contacts', data: $form.serialize(), type: 'POST')
    .done((resp) ->
      $form.hide()

      return
    )
    .fail((xhr) ->
      console.log xhr
      return
    )
  return
