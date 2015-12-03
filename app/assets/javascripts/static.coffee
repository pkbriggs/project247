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
    console.log "R"

$(".static.quiz1_verify_details").ready ->
  $("#primary_products").tagit
    allowSpaces: true
