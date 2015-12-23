$(document).on('ready page:load', function() {
  console.log('hoge')
  $('#user-page-sidebar a').removeClass('is_active');
  $(this).addClass('is_active');
});

