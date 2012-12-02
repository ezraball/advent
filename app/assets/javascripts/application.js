// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require jquery-ui


$(document).ready(function() {
	$('.dt').datepicker({
		autoclose:true,
		dateFormat: "yy-mm-dd"		
	});
	$('#endragify').click(function() {
			$('.numlink').draggable({
				cursor: 'move',
				stop: function() {
					entry_id = $(this).attr('data-eid');
					var x = $(this).position().left;
					var y = $(this).position().top;
					$.ajax({
						url: "/entries/" + entry_id + "/form",
						success: function(data) {
							$('#entryformarea').html(data);
							$('#xid').val(x);
							$('#yid').val(y);
						}
					});				
				}
			});
	});
});