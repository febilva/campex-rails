$(document).on "ready page:load", ->
  if $('#side_menu').length
    $.getScript('/dashboard/update_menu.js')

  $(".proceed.button").click ->
    $(".real-content").addClass( "loading" );
    $("html, body").animate({ scrollTop: 0 }, "slow");

  if($('input[class="datepicker"]'))
    now = new Date
    $('input[class="datepicker"]').daterangepicker {
      singleDatePicker: true
      format: 'DD-MM-YYYY'
      showDropdowns: true
      startDate: new Date(now.getFullYear() - 18, now.getMonth(), now.getDate())
    }

    $('.ui.checkbox').checkbox()
