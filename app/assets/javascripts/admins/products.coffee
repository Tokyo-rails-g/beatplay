
  $ -> 
    "use strict"
    $content = $('.field:last-child')
    $('.add_btn').on 'click', -> 
      $content.clone(true).appendTo('.parent')


  $('.parent').on 'click','.trash_btn', -> 
    $(this).parents('.field').remove()

