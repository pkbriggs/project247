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

  $(".fa-times").on "click", (e) ->
    if !$(".hidden_contact_info_container").hasClass("hidden_overlay")
      $(".hidden_contact_info_container").addClass("hidden_overlay")
      e.stopPropagation()

  $("body").on "click", (e) ->
    if !$(".hidden_contact_info_container").hasClass("hidden_overlay")
      $(".hidden_contact_info_container").addClass("hidden_overlay")

# Matches page
enableSeeMoreMatches = ->
  $(".see_more_matches").one "click", ->
    $(".extra_top_matches").show()
    setTimeout(->
      $(".extra_top_matches").addClass "visible"
    , 50)
    $(".see_more_matches").html("See fewer matches <i class='fa fa-angle-up'></i>")
    enableSeeLessMatches()

enableSeeLessMatches = ->
  $(".see_more_matches").one "click", ->
    $(".extra_top_matches").removeClass "visible"
    setTimeout(->
      $(".extra_top_matches").hide()
    , 300)
    $(".see_more_matches").html("See more matches <i class='fa fa-angle-down'></i>")
    enableSeeMoreMatches()

$(".static.matches").ready ->
  enableSeeMoreMatches()

