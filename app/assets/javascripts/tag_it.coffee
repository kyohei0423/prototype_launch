$(document).on 'ready page:load', ->
  $('#question-tags').tagit
    fieldName:   'question[tag_list]'
    singleField: true
