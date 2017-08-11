$(document).on('turbolinks:load', function() {
  $('#textarea').keypress(function(e){
    if(e.which === 13)  {
      e.preventDefault()
      $(this).closest('form').submit();
    }
  });
});
