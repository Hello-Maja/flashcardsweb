$(document).ready( function(){
  $('.login').hide();
  $('.navbar h2').on('click',function(){
    $('.login').show();
    $(this).addClass('hover');
  });
  $('img').hide();

  $('button').on('click',function(){
    $('button').remove();
    $('img').slideDown(); 

  });
  $('#submit-answer').on('click',function(){
    $('img').hide();
  });


}); 

