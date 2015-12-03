# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".static.index").ready ->
  if $(".index_status").data "showalert"
    notie.alert 1, 'Seed data saved successfully!', 2.0

$(".static.seed_data").ready ->
  $("#fixed-path-1").on "click", ->
    console.log "D"
    $("#possible_match_name")

  $("#fixed-path-2").on "click", ->
    console.log "R"

$(".static.quiz1_verify_details").ready ->
  $("#primary_products").tagit
    allowSpaces: true
