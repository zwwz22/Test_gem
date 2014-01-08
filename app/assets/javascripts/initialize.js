$(function(){
  $('.ui.checkbox')
    .checkbox()

  $('.ui.dropdown')
    .dropdown({'on':'hover'})
  ;
  handler = {

    activate: function() {
      if(!$(this).hasClass('dropdown')) {
        $(this)
          .addClass('active')
          .closest('.ui.menu')
          .find('.item')
          .not($(this))
          .removeClass('active')
        ;
      }
    }

  }
  ;


  $menuItem = $('.menu a.item, .menu .link.item');
  $menuItem.on('click', handler.activate)
  ;

  $('.ui.form')
    .form({
      firstName: {
        identifier  : 'first-name',
        rules: [
          {
            type   : 'empty',
            prompt : '名字不能空'
          }
        ]
      },
      lastName: {
        identifier  : 'last-name',
        rules: [
          {
            type   : 'empty',
            prompt : '名字不能空'
          }
        ]
      },
      username: {
        identifier : 'user[:name]',
        rules: [
          {
            type   : 'empty',
            prompt : '名字不能空'
          }
        ]
      },
      password: {
        identifier : 'user[:password]',
        rules: [
          {
            type   : 'empty',
            prompt : '密码不为空'
          },
          {
            type   : 'length[4]',
            prompt : '至少4位'
          }
        ]
      },
      terms: {
        identifier : 'terms',
        rules: [
          {
            type   : 'checked',
            prompt : 'You must agree to the terms and conditions'
          }
        ]
      }
    });

})
