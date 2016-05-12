$(document).on 'ready page:load', ->
  $('.subjects').change (event) ->
    $('#' + $(this).attr('id').replace('subject', 'max_mark')).val($(this).find(':selected').data("max-marks"))

  $('.ui.marks').keydown((event) ->
    if event.which >= 96 and event.which <= 105
      numPadToKeyPadDelta = 48
      event.which = event.which - numPadToKeyPadDelta
    if $.inArray(event.which, [
        8
        9
        37
        39
        16
        17
        18
      ]) > -1
      return true
    else if !$.isNumeric(String.fromCharCode(event.which))
      event.preventDefault()
    else
      max_mark = $('#' + $(this).attr('id').replace('mark', 'max_mark')).val()
      current_mark = parseInt($(this).val() + String.fromCharCode(event.which))
      if current_mark > max_mark
        event.preventDefault()
    return
  ).keyup (event) ->
    a = 0
    $('.marks').each ->
      temp = parseInt($(this).val())
      if $.isNumeric(temp)
        a += temp
      $('#total_marks').val a
      return
    return
  return
