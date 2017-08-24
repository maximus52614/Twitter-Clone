$(document).on('turbolinks:load', function() {
  var textmax = 150;
  $('#textarea_feedback').html(textmax + ' characters remaining ');

  $('#textarea').keyup(function() {
    var textmax = 150;
    var text_length = $('#textarea').val().length;
    var text_remaining = textmax - text_length;

    $('#textarea_feedback').html(text_remaining + ' characters remaining ');
    });
  });





//   $('#textarea').keyup(function() {
//     console.log('pressed')
//     const len = $("#textarea").val().length
//     console.log(len)
//     $('#charLeft').text(len);
//   })
// });
