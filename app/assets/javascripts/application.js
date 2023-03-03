// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require cocoon
//= require_tree .

$(document).ready(function() {
  setTimeout(function() {
    $('.alert').fadeOut('slow', function() {
      $(this).remove();
    });
  }, 5000); // 5 seconds
});

$(document).on('turbolinks:load', function() {
  $('body').on('change', '.question-type', function() {
    var target = event.target;
    var questionType = target.value;
    var customCard = $($(target).parents('.custom-card'))

    if (questionType == 'multiple_choice' || questionType == 'single_choice') {
      customCard.find('.range-option-field, .picture-option-field, .range-option-button, .picture-option-button').addClass('d-none')
      customCard.find('.option-button').removeClass('d-none')
    } else if (questionType == 'range') {
      customCard.find('.option-field, .picture-option-field, .option-button, .picture-option-button').addClass('d-none')
      customCard.find('.range-option-button').removeClass('d-none')
    } else  {
      customCard.find('.option-field, .range-option-field, .option-button, .range-option-button').addClass('d-none')
      customCard.find('.picture-option-button').removeClass('d-none')
    }
  });
});


// JavaScript to preview image on file selection
$(document).on('change', '.picture-option-field', function() {
  var reader = new FileReader();
  var imageSibling = $(event.target).siblings('.preview');
  reader.onload = function(e) {
    imageSibling.attr('src', e.target.result);
    imageSibling.removeClass('d-none');
  }
  reader.readAsDataURL(this.files[0]);
});
