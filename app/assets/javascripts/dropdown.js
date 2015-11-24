$(window).load(function () {
  var $hiddenBlock = $('.hidden-block'),
    $menuicon = $('#menuicon'),
    $menu = $("#menu")

  $hiddenBlock.hide();

  $menuicon.click(function(){
    $menu.slideToggle();
    $hiddenBlock.show();
  });

  $hiddenBlock.click(function(){
    $menu.slideUp();
  });
});
