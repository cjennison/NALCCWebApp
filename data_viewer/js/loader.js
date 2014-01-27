var MapLoadTracker = {
	
	trackers:[],
	enabled:true,
	
	addTracker:function(layer,title, hide){
		
		var load_object = {};
			load_object.layer = layer;
			load_object.pct   = 0;
			load_object.live  = false;
			load_object
			
		
		if(MapLoadTracker.enabled)
			$('.loading_panel').css("display", "block");
		
		var div = $("<li><div class='loading-object'></div></li>");
		$(div).append("<span>" + title + "</span><span style='float:right' class='hide-prog icon-remove'></span>");
		$(div).append('<div class="progress progress-striped active">' + 
					  	'<div class="bar" style="width: 0%;"></div>' +
					  '</div>');
					  
		var bar = $(div).find(".bar");
		if(!hide){
			$(".loading_panel ul").append(div);
			load_object.live = true;
		}
			
		
		load_object.div = div;
		load_object.bar = bar;
		
		layer.load_component = load_object;
		
		layer.events.register('tileloaded', layer, function(){
			console.log(this.load_component)
			if(this.load_component.live == false){
				if(MapLoadTracker.enabled)
					$('.loading_panel').css("display", "block");

				$(".loading_panel ul").append(this.load_component.div);
				this.load_component.live = true;
			}
			console.log("TILES LEFT: " + this.numLoadingTiles);
			var total = this.grid.length * this.grid[0].length;
			$(this.load_component.bar).css("width", (((total-this.numLoadingTiles)/total)*100) + "%");
		})
		
		layer.events.register('loadend', layer, function(){
			var that = this;
			setTimeout(function(){
				$(that.load_component.div).remove();
				that.load_component.live = false;
				MapLoadTracker.checkTracker();
				
			},1000)
		})
		
		
		
	},
	
	checkTracker:function(){
		if($('.loading_panel ul li').length == 0){
			$('.loading_panel').css("display", "none");
			return false;
		}
		return true;
	},
	
	updateTracker:function(layer){
		//null
	},
	
	toggleLoader:function(){
		if(!MapLoadTracker.enabled){
			if(MapLoadTracker.checkTracker())
				$('.loading_panel').css("display", "block");
			MapLoadTracker.enabled = true;
		} else {
			$('.loading_panel').css("display", "none");
			MapLoadTracker.enabled = false;
		}
			
			
	},
	
	addManualTracker:function(title){
		var load_object = {};
			
		
		if(MapLoadTracker.enabled)
			$('.loading_panel').css("display", "block");
		
		var div = $("<li><div class='loading-object'></div></li>");
		$(div).append("<span>" + title + "</span><span style='float:right' class='hide-prog icon-remove'></span>");
		$(div).append('<div class="progress progress-warning progress-striped active">' + 
					  	'<div class="bar" style="width: 100%;"></div>' +
					  '</div>');
					  
		var bar = $(div).find(".bar");
		$(".loading_panel ul").append(div);
		
		
		load_object.div = div;
		
		
		


		return load_object;
	},
	
	removeManualTracker:function(tracker){
		$(tracker.div).remove();
		MapLoadTracker.checkTracker();
	}
	
	
}
