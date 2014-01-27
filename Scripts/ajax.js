$(window).on('beforeunload', function(){
	for (var x=0;x<rpccr_id.length;x++) {
		input = {"ws":"rpccr", "cs": rpccr_id[x], "style": "rpccr_style", "file_name": rpccr_file_name[x]};
		socket.emit('delete_rpccr_data', input);
		}
	});

$(document).ready(function() {
	$("#get_feature").resizable().draggable();	
  });