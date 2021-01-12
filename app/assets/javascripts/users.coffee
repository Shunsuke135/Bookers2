# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#address_zipcode").jpostal({
    postcode : [ "#address_zipcode" ],

    address  : {
                  "#user_prefecture_code" : "%3",
                  "#city"            : "%4%5",
                  "#street"          : "%6%7"
                }
  })
