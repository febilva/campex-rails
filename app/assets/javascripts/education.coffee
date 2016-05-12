
$(document).on "ready page:load", ->
  $('.ui.boards.dropdown').dropdown({placeholder: 'Board Name'})
  $('.ui.boards.dropdown').change ->
    $('.ui.streams.dropdown').first().dropdown('clear')

  $('.ui.streams.dropdown').dropdown
    placeholder: 'State'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/boards/{board_id}/streams.json'
      beforeSend: (settings) ->
        board_id = $('.ui.boards.dropdown').first().find(':selected').val()
        # cancel request if no id
        if !board_id
          return false
        settings.urlData.board_id = board_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, stream) ->
          response['results'].push {"description": stream.name, "data-value": stream.id}
        response
