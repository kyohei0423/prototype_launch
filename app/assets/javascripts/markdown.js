$(window).on('load', function() {
  $('#input-textarea').on('keyup', function() {
    var text = $('#input-textarea').val();
    document.getElementById('output-area').innerHTML = marked(text);
  });
  $('#input-textarea-answer').on('keyup', function() {
    var text = $('#input-textarea-answer').val();
    document.getElementById('output-area-answer').innerHTML = marked(text);
  });
});
