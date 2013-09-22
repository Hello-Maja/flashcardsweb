$(document).ready(function() {
  $('#card form').on('submit',function(event){
    event.preventDefault();
    $('#answer').hide();
    var user_entry = $('#answer input').val();
    var form_action = $('#hidden').html();
    $.post(form_action, {guess: user_entry}, function(result){
      $('#card').append(result);
   });
  });
});
