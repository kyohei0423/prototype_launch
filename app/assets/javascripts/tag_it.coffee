$(document).on 'ready page:load', ->
  $('#question-tags').tagit
    fieldName:   'question[tag_list]'
    singleField: true
    availableTags: gon.available_tags
  if gon.question_tags?
    for tag in gon.question_tags
      $('#question-tags').tagit 'createTag', tag
