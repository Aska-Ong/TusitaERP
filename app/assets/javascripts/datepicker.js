$(function() {
  $('.datepicker').datepicker(
  	{altField: '.datepicker', altFormat: 'yy-mm-dd'}
  	);
});

$(window).bind('page:change', function() {
  $('.datepicker').datepicker({altField: '.datepicker', altFormat: 'yy-mm-dd'}
  	);
});