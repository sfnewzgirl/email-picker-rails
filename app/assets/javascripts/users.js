$(document).on('turbolinks:load',
  function() {
    console.log('Sanity check: turbolinks has loaded users.js.');

  function emailOptOut() {
    jQuery('#opt_out_true').on('click', function() {
      console.log('opt out button clicked');
      if ($('#opt_out_true').val()) {
        $('#check_box').val(false)
      }
    })
  }

})
