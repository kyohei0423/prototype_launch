$(window).on('load', function() {
  ajaxSearch = function(input) {
    $.ajax({
      url: "search",
      type: "GET",
      data: ("keyword=" + input)
    });
  };
  $('#inc_search').on('keyup', function() {
    var input = $.trim($(this).val()),
        preFunc = null;
    clearTimeout(preFunc);
    preFunc = setTimeout(ajaxSearch, 5000, input);
  });
});
