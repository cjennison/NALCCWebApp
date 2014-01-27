

window.onresize = function(event){
	if(window.innerWidth > 800){
		$(".legend").draggable("enable");
		$(".layer-history").draggable("enable");
		//$(".user-basin-panel").draggable("enable");
		//$(".user-basin-panel").resizable();
	} else {
		$(".legend").draggable("disable");
		$(".legend").css("opacity", "1");
		$(".layer-history").draggable("disable");
		$(".layer-history").css("opacity", "1");
		//$(".user-basin-panel").resizable("destroy");
		//$(".user-basin-panel").draggable("enable");
		$(".user-basin-panel").css("opacity", "1");
		resetPositionProperties()

	}
}

//Sets the top and left properties to blank parameters, allowing for other
//position properties to be used
function resetPositionProperties(){
	$(".user-basin-panel").css({
			'top':'',
			'left':''
		})
	$(".layer_controls").css({
			'top':'',
			'left':''
		})
}
