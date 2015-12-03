# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".static.index").ready ->
  if $(".index_status").data "showalert"
    notie.alert 1, 'Seed data saved successfully!', 2.0

$(".static.seed_data").ready ->
  $("#fixed-path-1").on "click", ->
    $("#possible_match_name").val("Peasant Pies")
    $("#possible_match_address").val("4108 24th St, San Francisco, CA 94114")

    # Match One - seed data
    $("#top_matches_1_name").val("San Francisco Coffee")
    $("#top_matches_1_description").val("Founded just three months ago, San Francisco Coffee is dedicated to getting its ingredients from the local SF community.")
    $("#top_matches_1_product_match_1").val("coffee")
    $("#top_matches_1_product_match_2").val("chocolates")
    $("#top_matches_1_match_reason_1").val("They are looking to expand their dessert options")
    $("#top_matches_1_match_reason_2").val("New business that is dedicated to the community")
    $("#top_matches_1_match_reason_3").val("Pies + coffee partnerships are incredibly popular")

    # Match two - seed data
    $("#top_matches_2_name").val("Tartine Bakery")
    $("#top_matches_2_description").val("Located right next to the Mission Dolores Park, Tartine Bakery is the best bakery in SF.")
    $("#top_matches_2_product_match_1").val("speciality wines")
    $("#top_matches_2_product_match_2").val("croissants")
    $("#top_matches_2_match_reason_1").val("Tartine Bakery is looking to add pies")
    $("#top_matches_2_match_reason_2").val("Wine pairs well with the dinner pies you sell")
    $("#top_matches_2_match_reason_3").val("Partnering will increase product visibility")

    # Match three - seed data
    $("#top_matches_3_name").val("The Flower Girl")
    $("#top_matches_3_description").val("The Flower Girl has been selling flowers in the Castro for over 25 years. Her flowers can brighten any gloomy day.")
    $("#top_matches_3_product_match_1").val("flowers")
    $("#top_matches_3_product_match_2").val("flower vases")
    $("#top_matches_3_match_reason_1").val("Dessert pies pair well with flowers as gifts")
    $("#top_matches_3_match_reason_2").val("Increased visibility for both businesses")
    $("#top_matches_3_match_reason_3").val("Perfect complimentary products for the holidays")

    console.log("Done setting Peasant Pies seed data")

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
    $("#top_matches_2_match_reason_1").val("Opportunity to the Castro art community")
    $("#top_matches_2_match_reason_2").val("Exhibtion runs for over two months")
    $("#top_matches_2_match_reason_3").val("Partnering will increase your art's visibility")

    # Match two - seed data
    $("#top_matches_3_name").val("Canvas Works")
    $("#top_matches_3_description").val("Founded 10 years ago by two local artists, Canvas Works provides art supplies at a low price.")
    $("#top_matches_3_product_match_1").val("paint brushes")
    $("#top_matches_3_product_match_2").val("canvas")
    $("#top_matches_3_match_reason_1").val("Cheap and high quality art materials")
    $("#top_matches_3_match_reason_2").val("Opportunity to the Castro art community")
    $("#top_matches_3_match_reason_3").val("Close by to your location")

    console.log("Done setting Bruce Kent seed data")

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

