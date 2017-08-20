// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs

$(document).ready(function() {
  $('.choice').click(function(event) {
    var element = $(event.currentTarget);
    $('.choices .choice').removeClass('check')
    element.addClass('check');
  });

  $('#submit').click(function(event) {
    var answer = $('.choices .check').first();
    var detail = $('.detail textarea');

    $.ajax({
      url: '/responses',
      method: 'POST',
      data: {
        answer: answer.data('value'),
        detail: detail.val()
      },
      dataType: 'json'
    }).done(function() {
      alert('Success');
      window.location = '/responses';
    }).error(function(response) {
      alert(response.responseJSON['error']);
    });

    return false;
  });
});
