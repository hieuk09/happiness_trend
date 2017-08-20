// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require vendor/chartist.min

$(document).ready(function() {
  $.ajax({
    url: '/responses',
    method: 'GET',
    dataType: 'json'
  }).done(function(data) {
    labels = data.map(function(r) { return r.created_date; });
    series = data.map(function(r) { return r.answer; });

    new Chartist.Line('.trend', {
      labels: labels,
      series: [series]
    });
  }).error(function() {
    alert('Cannot load data');
  });
});
