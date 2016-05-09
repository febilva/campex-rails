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
      showDropdowns: true
      startDate: new Date(now.getFullYear() - 18, now.getMonth(), now.getDate())
    }

    $('.dropdown').dropdown({ transition: 'drop' })
    $('.ui.checkbox').checkbox()
    $('.ui.communication.checkbox').on 'change', ->
      $('.communication.segment').toggle()
      
      if $('.ui.communication.checkbox').checkbox('is checked')
        value = "None"
      else
        value = ""
      $('#student_comm_address_line1').val(value)
      $('#student_comm_address_line2').val(value)
      $('#student_comm_taluk').val(value)
      $('#student_comm_post_office').val(value)
      $('#student_comm_pincode').val(value)

      $('#guardian_address_line1').val(value)
      $('#guardian_address_line2').val(value)
      $('#guardian_taluk').val(value)
      $('#guardian_post_office').val(value)
      $('#guardian_pincode').val(value)
