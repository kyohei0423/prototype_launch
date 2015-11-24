$(window).on('load', function() {
  $('#input-textarea').on('keyup', function() {
    var question = $('#input-textarea').val();
    document.getElementById('output-area').innerHTML = marked(question);
  });
  $('#input-textarea-answer').on('keyup', function() {
    var answer = $('#input-textarea-answer').val();
    document.getElementById('output-area-answer').innerHTML = marked(answer);
  });
});
