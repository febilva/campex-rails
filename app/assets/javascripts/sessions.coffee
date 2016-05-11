$(document).on "ready page:load", ->
  $('#facebook-login').on 'click', ->
    window.location.href = "/auth/facebook"
  $('#google-login').on 'click', ->
    window.location.href = "/auth/google_oauth2"
