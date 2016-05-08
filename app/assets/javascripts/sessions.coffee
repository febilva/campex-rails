$(document).on "ready page:load", ->
  $('#facebook-login').on 'click', ->
    window.location.href = "/auth/facebook"
