# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

_bm_event = {name: "sale", property_1: "some value", property_2: "some other value" }

track = () ->
  _bm_request = new XMLHttpRequest();
  _bm_request.open("POST", "http://blocmetrics.com/events.json", true);
  _bm_request.setRequestHeader('Content-Type', 'application/json');
  _bm_request.onreadystatechange = send

  _bm_request.send(JSON.stringify(_bm_event));



