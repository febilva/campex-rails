$(document).on "ready page:load", ->
  if $('#side_menu').length
    $.getScript('/dashboard/update_menu.js')

  $(".proceed.button").click ->
    $(".real-content").addClass( "loading" );
    $("html, body").animate({ scrollTop: 0 }, "slow");
