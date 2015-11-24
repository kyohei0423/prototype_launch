$(window).load(function () {
  var $hidden_block = $('.hidden-block')
  var $menuicon = $('#menuicon')
  var $menu = $("#menu")

  $hidden_block.hide();

  $menuicon.click(function(){
    $menu.slideToggle();
    $hidden_block.show();
  });

  $hidden_block.click(function(){
    $menu.slideUp();
  });
});
