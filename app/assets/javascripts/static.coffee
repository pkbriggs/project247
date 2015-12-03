# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".static.index").ready ->
  if $(".index_status").data "showalert"
    notie.alert 1, 'Seed data saved successfully!', 2.0

$(".static.seed_data").ready ->
  $("#fixed-path-1").on "click", ->
    $("#possible_match_name").val("Sweet Inspirations")
    $("#possible_match_address").val("2239 Market Street, San Francisco CA 94114")

    # Match One - seed data
    $("#top_matches_1_name").val("")
    $("#top_matches_1_description").val("")
    $("#top_matches_1_product_match_1").val("")
    $("#top_matches_1_product_match_2").val("")
    $("#top_matches_1_match_reason_1").val("")
    $("#top_matches_1_match_reason_2").val("")
    $("#top_matches_1_match_reason_3").val("")

    # Match two - seed data
    $("#top_matches_2_name").val("")
    $("#top_matches_2_description").val("")
    $("#top_matches_2_product_match_1").val("")
    $("#top_matches_2_product_match_2").val("")
    $("#top_matches_2_match_reason_1").val("")
    $("#top_matches_2_match_reason_2").val("")
    $("#top_matches_2_match_reason_3").val("")

    # Match two - seed data
    $("#top_matches_3_name").val("")
    $("#top_matches_3_description").val("")
    $("#top_matches_3_product_match_1").val("")
    $("#top_matches_3_product_match_2").val("")
    $("#top_matches_3_match_reason_1").val("")
    $("#top_matches_3_match_reason_2").val("")
    $("#top_matches_3_match_reason_3").val("")

    console.log("Done setting Sweet Inspirations seed data")


  $("#fixed-path-2").on "click", ->
    $("#possible_match_name").val("Bruce Kent")
    $("#possible_match_address").val("140 15th Street, San Francisco CA 94114")

    # Match One - seed data
    $("#top_matches_1_name").val("Sweet Inspirations")
    $("#top_matches_1_description").val("A staple of the Castro neighborhood, Sweet Inspirations is known for its delicious cake and its commitment to the local community.")
    $("#top_matches_1_product_match_1").val("space for art")
    $("#top_matches_1_product_match_2").val("cake")
    $("#top_matches_1_match_reason_1").val("Sweet Inspirations needs art for December")
    $("#top_matches_1_match_reason_2").val("Partnering will increase your art's visibility")
    $("#top_matches_1_match_reason_3").val("Free cake along with payment for art")

    # Match two - seed data
    $("#top_matches_2_name").val("The Castro Theater")
    $("#top_matches_2_description").val("The Castro Theater has been around longer than most residents of the Castro, located at the heart of Castro Street.")
    $("#top_matches_2_product_match_1").val("special art exhibition")
    $("#top_matches_2_product_match_2").val("exposure")
    $("#top_matches_2_match_reason_1").val("Opportunity to meet members of the Castro art community")
    $("#top_matches_2_match_reason_2").val("Exhibtion runs for over two months")
    $("#top_matches_2_match_reason_3").val("Partnering will increase your art's visibility")

    # Match two - seed data
    $("#top_matches_3_name").val("Canvas Works")
    $("#top_matches_3_description").val("Founded 10 years ago by two local artists, Canvas Works provides art supplies at a low price.")
    $("#top_matches_3_product_match_1").val("paint brushes")
    $("#top_matches_3_product_match_2").val("canvas")
    $("#top_matches_3_match_reason_1").val("Cheap and high quality art materials")
    $("#top_matches_3_match_reason_2").val("Opportunity to meet members of the Castro art community")
    $("#top_matches_3_match_reason_3").val("Close by to your location")

    console.log("Done setting Sweet Inspirations seed data")

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

