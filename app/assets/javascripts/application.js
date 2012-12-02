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

var channel = 1;

function switchChannel() {
	if (channel == 1) {
		channel = 2;
	} else {
		channel = 1;
	}
	$('#currchan').html(channel);
	$('.etrig').attr('channel_id',channel);
}

$(document).ready(function() {
	$('.dt').datepicker({
		autoclose:true,
		dateFormat: "yy-mm-dd"		
	});
	
	$('.channelchange').click(function() {
		switchChannel();
	});
	
	$('.etrig').click(function() {
		$('#myModal').modal({
			keyboard: true,
			remote: '/calendars/' + $(this).attr('calendar_id') + '/entries/' + $(this).attr('entry_id') + '?channel=' + $(this).attr('channel_id')
		}).modal('show');
	});
	
	$('#myModal').on('shown', function(e) {
	    var modal = $(this);

	    modal.css('margin-top', (modal.outerHeight() / 2) * -1)
	         .css('margin-left', (modal.outerWidth() / 2) * -1);

	    return this;
	}).on('hidden', function() {
	    $(this).removeData('modal');
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
