# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$ ->
  $("#add_file").on "ajax:success", (event, data) ->
    $("#attachments").append data
    $(this).data "params", { index: $("#attachments div.file").length }
