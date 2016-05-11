
$(document).on "ready page:load", ->
  $('.ui.permanent.countries.dropdown').dropdown()
  $('.ui.communication.countries.dropdown').dropdown()

  $('.ui.permanent.countries.dropdown').change ->
    $('.ui.permanent.states.dropdown').first().dropdown('clear')
  $('.ui.permanent.states.dropdown').change ->
    $('.ui.permanent.districts.dropdown').first().dropdown('clear')

  $('.ui.permanent.states.dropdown').dropdown
    placeholder: 'State'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/countries/{country_id}/states.json'
      beforeSend: (settings) ->
        country_id = $('.ui.permanent.countries.dropdown').first().find(':selected').val()
        # cancel request if no id
        if !country_id
          return false
        settings.urlData.country_id = country_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, state) ->
          response['results'].push {"description": state.name, "data-value": state.id}
        response

  $('.ui.permanent.districts.dropdown').dropdown
    placeholder: 'District'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/states/{state_id}/districts.json'
      beforeSend: (settings) ->
        state_id = $('.ui.permanent.states.dropdown').first().find(':selected').val()
        # cancel request if no id
        if !state_id
          return false
        settings.urlData.state_id = state_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, district) ->
          response['results'].push {"description": district.name, "data-value": district.id}
        response

  $('.ui.communication.countries.dropdown').change ->
    $('.ui.communication.states.dropdown').first().dropdown('clear')
  $('.ui.communication.states.dropdown').change ->
    $('.ui.communicationt.districts.dropdown').first().dropdown('clear')

  $('.ui.communication.states.dropdown').dropdown
    placeholder: 'State'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/countries/{country_id}/states.json'
      beforeSend: (settings) ->
        country_id = $('.ui.communication.countries.dropdown').first().find(':selected').val()
        # cancel request if no id
        if !country_id
          return false
        settings.urlData.country_id = country_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, state) ->
          response['results'].push {"description": state.name, "data-value": state.id}
        response

  $('.ui.communication.districts.dropdown').dropdown
    placeholder: 'District'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/states/{state_id}/districts.json'
      beforeSend: (settings) ->
        state_id = $('.ui.communication.states.dropdown').first().find(':selected').val()
        # cancel request if no id
        if !state_id
          return false
        settings.urlData.state_id = state_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, district) ->
          response['results'].push {"description": district.name, "data-value": district.id}
        response

    if $('.ui.communication.checkbox').length
      address_elements = [ 'address_line1', 'address_line2',
        'countries', 'states', 'districts', 'taluk', 'post_office', 'pincode' ]

      clear_address_values = () ->
        $.each address_elements, (i, element) ->
          element_class = ".communication.".concat(element.replace("_", "."))
          if !$(element_class).length
            element_class = ".permanent.".concat(element.replace("_", "."))

          if $(element_class).hasClass("dropdown")
            $(element_class).dropdown("clear")
          else
            $(element_class).val("")


      observe_communication_same =  ->
        if $('.ui.communication.checkbox').checkbox('is checked')
          $('.communication.segment').hide()
          clear_address_values()
        else
          $('.communication.segment').show()

      observe_communication_same()
      $('.ui.communication.checkbox').on 'change', ->
        observe_communication_same()
