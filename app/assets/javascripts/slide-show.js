$(document).on('ready page:load', function() {
  var slideWidth = $('.slide').outerWidth();
  var slideNum = $('.slide').length;
  var slideSetWidth = slideWidth * slideNum + 100;
  var sliding = function() {
    if( slideCurrent < 0 ){
      slideCurrent = slideNum - 1;
    } else if( slideCurrent > slideNum - 1 ) {
      slideCurrent = 0;
    }
    $('.slide-set').stop().animate({
      left: slideCurrent * -slideWidth
    });
  }
  var slideCurrent = 0;
  console.log(slideWidth)
  $('.slide-set').css('width', slideSetWidth);
  $('.slider-prev').on('click', function(){
    slideCurrent--;
    sliding();
  });
  $('.slider-next').on('click', function (){
    slideCurrent++;
    sliding();
  });
});
