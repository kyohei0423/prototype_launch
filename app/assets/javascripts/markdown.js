$(document).on('ready page:load', function() {
  $('#text').on('keyup', function() {
    var text = $('#text').val();
    document.getElementById('output-area').innerHTML = marked(text);
  });
});
