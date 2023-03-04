$(function() {
  console.log('hello')
  $('body').on('click', '#submit-answers-button', function(event){
    $("#fill-questionnaire-form").submit()
  })
});
