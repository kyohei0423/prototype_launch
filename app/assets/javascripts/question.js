// $(window).bind("resize ready", function(event){
//     $('#input-textarea').height($('#input-textarea').height()  + $(window).height() - $(document.body).height());
// });
$(window).on('load', function() {
  var bodyHeight = $('body').height(),
      headerHeight = $('header').height(),
      contentHeight = bodyHeight - headerHeight;

  $('.content').css('height', contentHeight);
  // $('formElementHeight').css('height', formBoxHeight - formElementHeight);
});
