$(document).on('turbolinks:load',
  function() {
    console.log('Sanity check: turbolinks has loaded users.js.');

  jQuery('#opt_out_true').on('click', function (event) {
    if ($('#opt_out_true').val()) {
      $('input[type="checkbox"]').prop('checked', false);
    }
  })

  $('input[type="checkbox"]').on('click', function(event) {
    if ($(this).prop('checked')) {
      $('#opt_out_true').prop('checked', false);
    }
  })

})
