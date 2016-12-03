$(document).on('turbolinks:load',
  function() {
    console.log('Sanity check: turbolinks has loaded users.js.');

  jQuery('#opt_out_true').on('click', function (event) {
    console.log('opt out button clicked');
    if ($('#opt_out_true').val()) {
      $('input[type="checkbox"]').attr('checked', false);
    }
  })

})
