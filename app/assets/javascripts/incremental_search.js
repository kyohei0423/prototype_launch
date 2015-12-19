$(document).on('ready page:load', function() {
  ajaxSearch = function(input) {
    $.ajax({
      url: "search",
      type: "GET",
      data: ("keyword=" + input)
    });
  };

  $('#fixed-header-drawer-exp').on('keyup', function() {
    var input = $.trim($(this).val()),
        timer = null;
    clearTimeout(timer);
    timer = setTimeout(ajaxSearch, 500, input);
  });
});
