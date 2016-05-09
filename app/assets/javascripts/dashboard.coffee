$(document).on "ready page:load", ->
  if $('#side_menu').length
    $.getScript('/dashboard/update_menu.js')

  $(".proceed.button").click ->
    $(".real-content").addClass( "loading" );
    $("html, body").animate({ scrollTop: 0 }, "slow");

  $('input[name="birthdate"]').daterangepicker {
    singleDatePicker: true
    showDropdowns: true
  }, (start, end, label) ->
    years = moment().diff(start, 'years')
    alert 'You are ' + years + ' years old.'
