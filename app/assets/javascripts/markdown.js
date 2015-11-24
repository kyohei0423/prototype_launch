$(window).on('load', function() {
  $('#input-textarea').on('keyup', function() {
    var text = $('#input-textarea').val();
    document.getElementById('output-area').innerHTML = marked(text);
  });
});
