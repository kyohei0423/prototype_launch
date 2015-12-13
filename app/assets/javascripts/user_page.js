$(document).on('ready page:load', function() {
  var $modalPanel = $("#modal-panel"),
      $modalContent = $("#modal-content"),
      $modalClose = $(".modal-close"),
      $editProfile = $(".edit-profile");

  $editProfile.on('click', function() {
    $modalPanel.show();
    $modalContent.show();
  });

  $modalClose.on('click', function() {
    $modalPanel.hide();
  });

  $modalPanel.on('click', function() {
    $(this).hide();
  });

  $modalContent.on('click', function(event) {
    event.stopPropagation();
  });
});
