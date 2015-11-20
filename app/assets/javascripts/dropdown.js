window.addEventListener("load", function() {
  $('.hidden-block').hide();

  $('#menuicon').click(function(){
    $("#menu").slideToggle();
    $('.hidden-block').show();
  });

  $('.hidden-block').click(function(){
    $("#menu").slideUp();
  });
});
