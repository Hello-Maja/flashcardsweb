$(document).ready( function(){
  $('.login').hide();
  $('.navbar h2').on('click',function(){
    $('.login').show();
    $(this).addClass('hover');
  });


}); 

