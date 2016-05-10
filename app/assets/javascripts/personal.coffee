$(document).on "ready page:load", ->
  $('.ui.gender.dropdown').dropdown()
  $('.ui.blood.group.dropdown').dropdown()
  $('.ui.religion.dropdown').dropdown()
  $('.ui.reservation.category.dropdown').dropdown()
  $('.ui.nationality.dropdown').dropdown()
  $('.ui.born.in.dropdown').dropdown()

  $('.ui.reservation.category.dropdown').change ->
    $('#student_caste_id').dropdown('clear')

  $('.ui.castes.dropdown').dropdown
    placeholder: 'Caste'
    fields:
      name: 'description'
      value: 'data-value'
    apiSettings:
      url: '/reservation_categories/{reservation_category_id}/castes.json'
      beforeSend: (settings) ->
        category_id = $('#student_reservation_category_id').find(':selected').val()
        # cancel request if no id
        if !category_id
          return false
        settings.urlData.reservation_category_id = category_id
      onResponse: (serverResponse) ->
        response = {}
        response['success'] = true
        response['results'] = []
        $.each serverResponse, (i, caste) ->
          response['results'].push {"description": caste.name, "data-value": caste.id}
        response
