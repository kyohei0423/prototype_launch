$(document).on('ready page:load', function() {
  $('.nav-tabs li').on('click', function() {
    var newTab = $(this).attr('id'),
        oldTab = $('.active').attr('id');
    $('li').removeClass('active');
    $(this).addClass('active');
    $('.elements').hide();
    $('.' + newTab).show();
  });
});
