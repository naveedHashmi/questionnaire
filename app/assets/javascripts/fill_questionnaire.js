$(function() {
  console.log('hello')
  $('body').on('click', '#submit-answers-button', function(event){
    event.preventDefault();

    $('#modal-success').modal('show')
  })
});
