$(document).ready(function() {
  $('#card form').on('submit',function(event){
    event.preventDefault();
    $('#submit-answer').hide();
    var user_entry = $('input').val();
    var form_action = $('#hidden').html();
    console.log(form_action);
    $.post(form_action, {guess: user_entry}, function(result){
      console.log(result);
      $('#card').append(result);

   });
  });
});
