# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".static.index").ready ->
  if $(".index_status").data "showalert"
    notie.alert 1, 'Seed data saved successfully!', 2.0

$(".static.quiz1_verify_details").ready ->
  $("#primary_products").tagit
    allowSpaces: true

$(".static.match_detail").ready ->
  $(".contact_button").on "click", (e) ->
    $(".hidden_contact_info_container").toggleClass("hidden_overlay")
    e.stopPropagation()

  $(".contact_info_card").on "click", (e) ->
    e.stopPropagation()

  $("body").on "click", (e) ->
    $(".hidden_contact_info_container").addClass("hidden_overlay")
