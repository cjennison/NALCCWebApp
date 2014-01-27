function loadMyBasins(){
		var user = "testuser1";
		$.getJSON("http://felek.cns.umass.edu:8888/" + user + "/basin/aliaslist.json", function(data){
			console.log("retrieved the users basins")
			console.log(data);
			
			$(".loader").html("");
			
			var ul = $(".basin_list");
			
			//Loop through basins and apply the names to the list
			user_list = data.list;
			for(var i = 0;i < user_list.length; i++){
				var basin = user_list[i];
				console.log("QQQQ")
				var li = $("<li><input type='checkbox' style='margin-right:5px;float:left;' checked='false' onclick='triggerBasin(this, " + basin.basin_id + ")'>" + basin.basin_alias + " [ " + basin.basin_id + "]</li>");
				$(li).find("input").prop("checked", false);
				$(ul).append(li);
				loadCatchments(basin.basin_id);
				
				
				
				
			}
			
			//$(".user-basin-panel").draggable({containment: 'parent'});
			//$(".user-basin-panel").resizable();
			
		})
		
		
		
		
		
	}
	function loadCatchments(id){
		$.getJSON("http://felek.cns.umass.edu:8888/" + id + "/catchment.geojson", function(geojson){
			console.log(geojson);
			var featurecollection = geojson;
			var geojson_format = new OpenLayers.Format.GeoJSON(
			{
				'internalProjection': new OpenLayers.Projection("EPSG:900913"),
				'externalProjection': new OpenLayers.Projection("EPSG:4326")
		
			});
			
			var myStyles = new OpenLayers.StyleMap({
                "default": new OpenLayers.Style({
                    pointRadius: "${type}", // sized according to type attribute
                    fillColor: "#ffcc66",
                    fillOpacity: "0",
                    strokeColor: "#ff9933",
                    strokeWidth: 2,
                    graphicZIndex: 1
                }),
                "select": new OpenLayers.Style({
                    fillColor: "#66ccff",
                    strokeColor: "#3399ff",
                    graphicZIndex: 2
                })
            });
			
			
			
			
			
			user_layer[id] = new OpenLayers.Layer.Vector("Basin", {
              	  styleMap: myStyles
				} 
			);
			map.addLayer(user_layer[id]);
			user_layer[id].setVisibility(false);
		
			var parsedColl = geojson_format.read(featurecollection)
		
			user_layer[id].addFeatures(parsedColl);
			user_layer[id].IDENTIFICATION = id;
			console.log(user_layer[id]);
			
			map.setLayerIndex(user_layer[id], 50);
			
			all_layers = [];
			
			for(var l in user_layer){
				all_layers.push(user_layer[l]);
			}
			
			select = new OpenLayers.Control.SelectFeature(all_layers,
				{
					multiple:true,
					highlight:function(feature){
						//NULL Do nothing, we are not highlighting the features
					}
				});
				map.addControl(select);
				select.activate();
			
			user_layer[id].events.on({
			    featureselected: function(event) {
			        showUserPopup(event);
			    }
			});
			
		})
	}
	
	function triggerBasin(el, id){
		console.log("TRIGGER: " + id)
		console.log($(el).attr("checked"))
		user_layer[id].setVisibility($(el).is(':checked'));
	}
	
	function showUserPopup(event){
		console.log(event);
		var basin_id = event.feature.layer.IDENTIFICATION;
		
		var name;
		for(var a in user_list){
			if(user_list[a].basin_id == basin_id){
				name = user_list[a].basin_alias;
			}
		}
		
		var basin_popup = $("<div class='basin_popup'><div class='pop-close btn btn-danger' onclick='destroy(this)'><span class=' icon-remove'></span></div><div class='pop-content'><h2 style='font-size: 19px;text-align: center;'>" + name + "</h1><div class='btn btn-primary' style='margin-left: 7px;' onclick='selectUserBasin(" + basin_id + ")'>Scenario Test This Basin</div></div></div>")
        $("body").append(basin_popup);
		$(basin_popup).css("top", mY);
		$(basin_popup).css("left", mX);
	}
	
function selectUserBasin(id){
		        window.open('http://felek.cns.umass.edu:8888/remote-login-completed?user=testuser1&basin_id=' + id,'_blank');

	}