var map;
var format = 'image/png';
var mX = 0;
var mY = 0;

var cursor_state = "auto";

var catchment_1,
	catchment_2,
	flow_1,
	flow_2,
	local,
	upstream,
	test_layer,
	basin_layer,
	static_catchments,
	markerslayer;
	
	var catchments;

var all_layers = [];

var user_layer = {};

var layer_arr = [];

var select = {};

var rule_ajax,
	rule_data;

var options = {
	flowlines: false,
}

var opacity = 1;
var basemaps = {
	
	basic:null,
	environmental:null,
	google:null
	
}

var options = {};
	options.color = "Grey";

var catchment_opacity = 0;

var cur_basemap = null;



var newWin = null;  
var user_list;

var infoControls,
	basinControls;
	
var enabled_layer = "local";
var LAYER_OFF = false;
	
var tips = [
	"You can zoom using a box selector by <br /> left shift and dragging the mouse",
	"Have you searched yet? <br />Mouse over the magifiying glass on the right to search!",
	"Some panels can be dragged! These are the<br /> The Basin Panel, Legend, and Basin Delineation Popup.",
	"If you are seeing white lines, <br /> be sure your browser is not zoomed in any way.",
	"You can view Local and Upstream statistics<br /> by toggling the radio button in the Layer panel."
]

var tips_enabled = false;
var tipN = 0;

var geocoder;
var clickN = 0;

var naming_rules;
var catchment_color = "#FF0000";
var outline_layer = "HUC4_WebsiteVersion";
var catchment_tracker;

function showTip(){
	
	if(!tips_enabled){
		return;
	}
	$(".tips").css("visibility", 'visible');
	$(".tips").css("opacity", '100');
	tipN = Math.floor(Math.random() * tips.length);
	$(".tips p").html(tips[tipN]);}

function nextTip(){
	tipN++;
	if(tipN >= tips.length){
		tipN = 0;
	}
	$(".tips p").html(tips[tipN])

}

function stopTips(){
	tips_enabled = false;
	$(".tips").css('visibility','hidden');
	$(".tips").css('opacity','0');
	
	$(".tip_checkbox").prop("checked", false);
	
}

function toggleTips(){
	if(tips_enabled == true){
		tips_enabled = false;
		$(".tips").css('visibility','hidden');
		$(".tips").css('opacity','0');
	}else {
		tips_enabled = true;
		$(".tips").css("visibility", 'visible');
		$(".tips").css("opacity", '100');
		$(".tips p").html(tips[Math.floor(Math.random() * tips.length)]);
	}
}

function clearLayer(){
	if(local){
		map.removeLayer(local);
		local = null;
	}

}

function setState(state){
	cursor_state = state;
	console.log(state);
	$('#map').css("cursor", state);
}


	function init()
	{
		
		
		naming_rules = $.getJSON("http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/informationformat.json", function(data){
			naming_rules = data;
			console.log(data);
		})
		
		
		$(".search_query").keyup(function(event){
		    if(event.keyCode == 13){
		        $(".searcher").click();
		    }
		});
		
		
		OpenLayers.ProxyHost = "proxy.cgi?url=";
		setInterval(function(){
			$(".olControlPanZoomBar").css("top", "auto");
			$(".olControlPanZoomBar").css("left", "auto");
			$(".olControlPanZoomBar").css("right", "40px");
	
			$(".olControlPanZoomBar").css("bottom", "330px");
				$( "window" ).scrollLeft( 0 );
			$( "window" ).scrollTop( 0 );
			window.scrollTo(0);

		},10)
		
		disableUpstreamLocal()
		//$(".basin-type").buttonset();
		
		$("input[name='basin']").on("change", function (e) {
		    console.log(this.value)
		    swapMaps(this.value);
		    enabled_layer = this.value;
		});
		
		$('body').tooltip({
	      selector: "a[data-toggle=tooltip]"
	    })
			
			
		setInterval(function(){
			showTip();
		},10000)
			
		console.log()
		
		$("#slider").slider({
			range: "min",
		      value: 100,
		      min: 1,
		      max: 100,
		      slide: function( event, ui ) {
		        $( ".l-opac" ).html(": " +  ui.value + "%");
		        opacity = ui.value/100;
		        setOpacity();
		      }
		});
		 //OpenLayers.ProxyHost = "proxy.cgi?url=";
		 
		 /*
		setInterval(function ()
		{
			$("html, body").animate(
			{
				scrollTop: 0,
				scrollLeft: 0
			}, "slow");
		}, 100);
		*/
		
		$(".legend").draggable(
		{
			containment: 'parent'
		});
		
		$(".option").draggable(
		{
			containment: 'parent'
		});
		
		$(".layer-history").draggable({
			containment: 'parent'
		})
		
		rule_data = $.getJSON("data_viewer/data/rules.json", function (data)
		{
			rule_data = data;
		});
		
		/*
		$(".color").spectrum({
		    color: "#f00",
		    change: function(color) {
		    	console.log(color.toHexString());
		        $("#color-box").css("background-color", color.toHexString());
		        catchment_color = color.toHexString();
		    }
		});
		
		*/
		
		window.onresize = function(){
			$(".olControlPanZoomBar").css("display", "none");

			setTimeout(function(){
				$(".olControlPanZoomBar").css("display", "block");
				$(".olControlPanZoomBar").css("top", "auto");
				$(".olControlPanZoomBar").css("left", "auto");
				$(".olControlPanZoomBar").css("right", "40px");
		
				$(".olControlPanZoomBar").css("bottom", "330px");
			},1)
			
			}

		map = new OpenLayers.Map('map',
		{
			projection: new OpenLayers.Projection("EPSG:5070"),
			displayProjection: new OpenLayers.Projection("EPSG:900913"),
			maxResolution: 0.0277901381032128,
			projection: "EPSG:3857",
			units: 'm',
			
			
		})

		map.addControl(new OpenLayers.Control.ScaleLine())
		map.addControl(new OpenLayers.Control.PanZoomBar())


		

		


		flow_1 = new OpenLayers.Layer.WMS(
			"Streams:Catchment", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NHDFlowline',
				transparent: "true",
				format: format,
			},
			{
				isBaseLayer: false,
				opacity: 0.6,
			}
		);

		

		flow_2 = new OpenLayers.Layer.WMS(
			"Streams:Catchment", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NHDFlowline_2',
				transparent: "true",
				format: format,
			},
			{
				isBaseLayer: false,
				opacity: 0.6,
			}
		);
		
		static_catchments = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NENY_NHDCatchments_LocalStats_2',
				transparent: "true",
				format: format,
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: 0,
			}
		);
		
		
		catchments = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:HUC4_WebsiteVersion',
				transparent: "true",
				format: format,
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: 0,
			}
		);
		

		 //var osm = new OpenLayers.Layer.OSM();
   		 //map.addLayer(osm);
		
		map.addLayers([ static_catchments, flow_1, flow_2, catchments]);
		
		
		MapLoadTracker.addTracker(catchments, "Outline", true);
		
		
        //map.setBaseLayer(basemaps.environmental);
        
        markerslayer = new OpenLayers.Layer.Markers( "Markers" );
		markerslayer.id = "Markers";
		map.addLayer(markerslayer);
		
		map.events.register("click", map, function(e) {
		   //markerslayer.clearMarkers();
		   if(clickN > 0)
		  	 markerslayer.clearMarkers();
		  console.log("CLICKED")
		      //var position = this.events.getMousePosition(e);
		   var position = map.getLonLatFromPixel(e.xy);
		   var size = new OpenLayers.Size(27,31);
		   var offset = new OpenLayers.Pixel(-(size.w/2), -size.h);
		   var icon = new OpenLayers.Icon('data_viewer/img/mark.png', size, offset);   
		  // var markerslayer = map.getLayer('Markers');
		 
		   markerslayer.addMarker(new OpenLayers.Marker(position,icon));
		   clickN++;
		  catchment_tracker =  MapLoadTracker.addManualTracker("Getting Catchment Information..")
		
		  });
        
        
		addBaseMaps();

		flow_1.setOpacity(0);
		flow_2.setOpacity(0);
		



		layer_arr = [catchment_1, catchment_2, local]
		//local.setVisibility(false);

		lat = (5227621.3924759 + 5222048.1441537) / 2;
		lon = (-8069742.7619704 + -8061341.2629284) / 2;
		map.setCenter(new OpenLayers.LonLat(lon, lat), 7);
		
		
		
		addMapEvents();
		
		
		
		loadMyBasins();
		
		
		
		
		
		
				$(".olControlZoom").css("display", "none");

		
		$(".olControlPanZoomBar").css("top", "auto");
		$(".olControlPanZoomBar").css("left", "auto");
		$(".olControlPanZoomBar").css("right", "40px");

		$(".olControlPanZoomBar").css("bottom", "290px");
		

		//map.addControl(new OpenLayers.Control.LayerSwitcher());
	}
	
	function addBaseMaps(){
		
		var arrayOSM = [
			"http://otile1.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.jpg",
			"http://otile2.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.jpg",
			"http://otile3.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.jpg",
			"http://otile4.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.jpg"
		];

		basemaps.environmental = new OpenLayers.Layer.OSM("MapQuest-OSM", arrayOSM,
		{
			opacity: 1.0

		});
		cur_basemap = basemaps.environmental;
		map.addLayer(basemaps.environmental);
		
				MapLoadTracker.addTracker(basemaps.environmental, "MapQuest", true);

		
		 basemaps.basic = new OpenLayers.Layer.OSM();
   		 map.addLayer(basemaps.basic);
   		 
				MapLoadTracker.addTracker(basemaps.basic, "OpenStreetMaps", true);
   		 
   		 basemaps.greyscale = new OpenLayers.Layer.OSM('Simple OSM Map', null, {
                eventListeners: {
                    tileloaded: function(evt) {
                        var ctx = evt.tile.getCanvasContext();
                        if (ctx) {
                            var imgd = ctx.getImageData(0, 0, evt.tile.size.w, evt.tile.size.h);
                            var pix = imgd.data;
                            for (var i = 0, n = pix.length; i < n; i += 4) {
                                pix[i] = pix[i + 1] = pix[i + 2] = (3 * pix[i] + 4 * pix[i + 1] + pix[i + 2]) / 8;
                            }
                            ctx.putImageData(imgd, 0, 0);
                            evt.tile.imgDiv.removeAttribute("crossorigin");
                            evt.tile.imgDiv.src = ctx.canvas.toDataURL();
                        }
                    }
                }
            });
            
            map.addLayer(basemaps.greyscale);
				MapLoadTracker.addTracker(basemaps.greyscale, "Cycle Map", true);
            basemaps.cyclemap = new OpenLayers.Layer.OSM("OpenCycleMap", ['http://a.tile.thunderforest.com/cycle/${z}/${x}/${y}.png',
                                                      'http://b.tile.thunderforest.com/cycle/${z}/${x}/${y}.png',
                                                      'http://c.tile.thunderforest.com/cycle/${z}/${x}/${y}.png']);
    		map.addLayer( basemaps.cyclemap);
    		
				MapLoadTracker.addTracker(basemaps.cyclemap, "Greyscale", true);
    		
    		basemaps.basic_nothing = new OpenLayers.Layer.WMS( "OpenLayers WMS", 
                      "http://labs.metacarta.com/wms/vmap0", 
                      {layers: 'basic'}
            );
                      
             map.addLayer(basemaps.basic_nothing);
             
				MapLoadTracker.addTracker(basemaps.basic_nothing, "Basic", true);
             
             
             var apiKey = "AqTGBsziZHIJYYxgivLBf0hVdrAk9mWO5cQcb8Yux8sW5M8c8opEC2lZqKR1ZZXf";

          	 basemaps.road = new OpenLayers.Layer.Bing({
                name: "Road",
                key: apiKey,
                type: "Road"
            });
            
             basemaps.hybrid = new OpenLayers.Layer.Bing({
                name: "Hybrid",
                key: apiKey,
                type: "AerialWithLabels"
            });
            
        
            
             basemaps.aerial = new OpenLayers.Layer.Bing({
                name: "Aerial",
                key: apiKey,
                type: "Aerial"
            });
   			// cur_basemap = basemaps.hybrid;
               map.addLayers([basemaps.road,basemaps.hybrid,basemaps.aerial]);
               
				MapLoadTracker.addTracker(basemaps.road, "Bing Roads", true);
				MapLoadTracker.addTracker(basemaps.hybrid, "Bing Hybrid", true);
				MapLoadTracker.addTracker(basemaps.aerial, "Bing Aerial", true);
               
              // map.setBaseLayer(basemaps.hybrid);
               //map.controls[3].destroy()
	}
	
	
	var pop;
	var txt;
	var etxt;
	function addMapEvents(){
		
		basinControls = {
			 click: new OpenLayers.Control.WMSGetFeatureInfo({
                url: 'http://felek.cns.umass.edu:8080/geoserver/Streams/wms', 
                title: 'Identify features by clicking',
                layers: [basin_layer],
                queryVisible: true,
                eventListeners: {
                getfeatureinfo: function(event) {
                	console.log(event);
                    
                }
            }
          })
        }
		
		for (var i in basinControls) { 
            basinControls[i].events.register("getfeatureinfo", this, showInfo);
            map.addControl(basinControls[i]); 
        }
        basinControls.click.activate();
		var projWGS84 = new OpenLayers.Projection("EPSG:4326");
		var proj900913 = new OpenLayers.Projection("EPSG:900913");
		
		infoControls = {
            click: new OpenLayers.Control.WMSGetFeatureInfo({
                url: 'http://felek.cns.umass.edu:8080/geoserver/Streams/wms', 
                title: 'Identify features by clicking',
                layers: [catchment_1,catchment_2,local, static_catchments],
                queryVisible: true,
                eventListeners: {
                getfeatureinfo: function(event) {
                	
                	if(cursor_state != 'auto'){
                		return;
                	}
                	
                	MapLoadTracker.removeManualTracker(catchment_tracker);
                	
                	$("#f-pop").remove();
                	console.log(event)
                	
                	var popText = $(event.text);
                	pop = popText; //testing purposes only
                	
                	//All rows in the table
                	var rows = $(popText).find("tr");
                	var labelRow = rows[0]; //Row with labels
                	rows.splice(0, 1); //Remove row with labels
                	
                	console.log(rows);
                	console.log(labelRow);
                	
                	//GATHERING ALL TABLE TITLES
                	var table_title_list = $(labelRow).find("th");
                	
                	var table_titles = [];
                	for(var i = 0;i < table_title_list.length;i++){
                		table_titles[i] = $(table_title_list)[i].innerHTML;
                	}
                	
                	console.log(table_titles)
                	
                	
                	//GATHERING ALL TABLE VALUES
                	var table_value_list = $(rows).find("td");
                	
                	var table_values = [];
                	for(var i = 0;i < table_value_list.length;i++){
                		table_values[i] = $(table_value_list)[i].innerHTML;
                	}
                	
                	console.log(table_values)
                	
                	
                	
                	var tbody = $("<table class='featureInfo'><tr><th>Label</th><th>Value</th><tr></table>");
                	for(var q = 0; q < table_title_list.length; q++){
                		var newRow = $("<tr></tr>");
                		console.log(table_title_list[q])
                		
                		var format = naming_rules[table_title_list[q].innerHTML];
                		var text = table_title_list[q].innerHTML;
                		if(format){
                			console.log(format);
                			if(format.remove){
                				//null
                			} else {
                				text = format.copy;
                				$(newRow).append("<td>" + text + "</td>");
                				
                				var val = parseFloat(table_value_list[q].innerHTML);
                				val = round(val, 3);
                				if(val < -9000){
                					val = "N/A"
                				}
                				$(newRow).append("<td>" + val + "</td>");
                			}
                			
                			
                		} else {
                			$(newRow).append("<td>" + text + "</td>");
                			$(newRow).append("<td>" + table_value_list[q].innerHTML + "</td>");
                		}
                		
                		
                		
                		
                		$(tbody).append(newRow);
                	}
                	
                	
                	
                	
                	
                	
                	
                	//Set up table to be re-populated with designed output
                	
                	//$(tbody).append(newLabelSet);
                	//$(tbody).append(newRowSet);
                	
                	console.log(tbody);
                	
                	
                	
                	pop = tbody;
                	
                	
                	txt = $("<div/>").html(event.text)
                	$(txt).find("table").remove();
                	
					var h_r = $(pop).find("tr")[4];
					console.log(pop);
					console.log($(pop).find("td")[1]);
                	
                	
                	$(txt).append("<h3>" + $(pop).find("td")[1].innerHTML + "</h3>")
                	
                	
                	var latlon = (map.getLonLatFromPixel(event.xy));
                	
                	var projWGS84 = new OpenLayers.Projection("EPSG:4326");
					var proj900913 = new OpenLayers.Projection("EPSG:900913");
                	
                	latlon = latlon.transform(proj900913, projWGS84)
                	console.log(latlon);
                	txt.append("<div class='btn btn-primary btn-small' id='catchment-delin' style='width: 228px;' onclick='delineateCatchment(this," + latlon.lat + ", " +  latlon.lon + ")'>Delineate Upstream Basin</div>");
                	txt.append("<div class='btn btn-success btn-small' id='use-basin' onclick='useBasin(this)' style='visibility:hidden'>Scenario Test This Basin</div>");
                	
                	$(txt).append(pop);
                	//txt.append("<div class='btn btn-primary btn-small' id='catchment-select' onclick='getCatchmentID(this," + latlon.lat + ", " +  latlon.lon + ")'>Select Catchment</div>");
                	
                	$(txt).find(".btn").click(function(e){
                		var r = $(txt).find("tr")[1];
                		var id = $(r).find("td")[2];
                		console.log(id);
                	})
                	
                	
                	
                   var p =  new OpenLayers.Popup(
                        "f-pop", 
                        map.getLonLatFromPixel(event.xy),
                        new OpenLayers.Size(325,340),
                        txt.html().toString(),
                        true
                        
                    );
                    
                    map.addPopup(p);

                    
                    setTimeout(function(){
                    	$("#f-pop_contentDiv").scrollTop(20)
                    	  var dragPopup = new OpenLayers.Control.DragPopup(p);
  						map.addControl(dragPopup);
  						//$("#f-pop_close").css("right","-30px");
                    },1000)
                    
                    
                }
            }
            })
            
           }
            
        for (var i in infoControls) { 
            infoControls[i].events.register("getfeatureinfo", this, showInfo);
            map.addControl(infoControls[i]); 
        }
        
        
        infoControls.click.activate();
		map.controls[3].destroy()
		
		map.events.register('mousemove', this.map, function(e){
			mX = e.pageX;
			mY = e.pageY;
			
			var pixel = new OpenLayers.Pixel(e.xy.x,e.xy.y);
  			var lonlat_t = map.getLonLatFromPixel(pixel);
  			lonlat_t = lonlat_t.transform(proj900913, projWGS84)
			
			$("#lat").html("<b>Latitude</b>: " + lonlat_t.lat + "&deg");
			$("#lon").html("<b>Longitude</b>: " + lonlat_t.lon + "&deg");
  			//console.log(lonlat_t)
		});
		
	}

	function useBasin(el){
		var item = $(el).parent();
		var r = $(item).find("tr")[4];
        var id = $(r).find("td")[1];
        var id_string = $(id).text();
        
        var returned_basin = getCookie(id_string + "_CONFIRM");
        window.open('http://felek.cns.umass.edu:8888/remote-login-completed?user=testuser1&basin_id=' + returned_basin,'_blank');
	}
	
	function round(num, places) {
	    var multiplier = Math.pow(10, places);
	    return Math.round(num * multiplier) / multiplier;
	}

	function getCatchmentID(el, lat, lon){
		console.log(lat + ":" + lon);
		var item = $(el).parent();
		var r = $(item).find("tr")[4];
                		var id = $(r).find("td")[1];
                		var id_string = $(id).text();
                		
        window.open('http://felek.cns.umass.edu:8888/remote-login?user=testuser1&catchment_id=' + id_string + "&lat=" + lat + "&lon=" + lon ,'_blank');
	}

	function delineateCatchment(el, lat, lon){
		
		var item = $(el).parent();
		var r = $(item).find("tr")[4];
		console.log($(item).find("tr")[4])
        var id = $(r).find("td")[1];
        console.log(id);
        var id_string = $(id).text();
		
		//Set cookie key
		document.cookie = id_string + "=PROCESSING; path=/";
		// window.open('http://felek.cns.umass.edu:8888/remote-login?user=testuser1&catchment_id=' + id_string + "&lat=" + lat + "&lon=" + lon ,'_blank');
		popUp('http://felek.cns.umass.edu:8888/remote-delineation?user=testuser1&catchment_id=' + id_string + "&lat=" + lat + "&lon=" + lon , 'fixed', 600, 600);
		
		console.log(id_string)
		startCheck(id_string);
		
		
	}
	
	function startCheck(id){
		console.log("CHECKING: " + id)
		function doCheck(id){
			setTimeout(function(){
				var status = getCookie(id + "_CONFIRM");
				if(status != null){
					console.log("BASIN COMPLETED");
					getCatchment(status);
				} else {
					doCheck(id);
				}
			},1000)
		}
		
		doCheck(id);
		
		
		
	}
	
	function getCatchment(key){
		$.getJSON("http://felek.cns.umass.edu:8888/" + key + "/catchment.geojson", function(data){
			if(basin_layer){
				map.removeLayer(basin_layer);
			}
			
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
			
			
			var featurecollection = data;
			var geojson_format = new OpenLayers.Format.GeoJSON(
			{
				'internalProjection': new OpenLayers.Projection("EPSG:900913"),
				'externalProjection': new OpenLayers.Projection("EPSG:4326")
		
			});
			
			basin_layer = new OpenLayers.Layer.Vector("Delineated Basin", {
				  styleMap: myStyles
				}
			);
			map.addLayer(basin_layer);
		
		
			var parsedColl = geojson_format.read(featurecollection)
		
			basin_layer.addFeatures(parsedColl);
			
			
			$("#use-basin").css("visibility", "visible");
			$("#catchment-delin").attr("disabled", true)
			$("#catchment-delin").css("opacity", "0")
			$("#catchment-delin").attr("onclick", "console.log('null')")
			
			
		})
	}
	
	function getCookie(id) {
	    var cname = id + "=";
	    var ca = document.cookie.split(';');
	    for (var i=0; i < ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ') c = c.substring(1,c.length);
	        if (c.indexOf(cname) == 0) {
	            return c.substring(cname.length, c.length);
	        }
	    }
	    return null;
	}
	
	function popUp(strURL, strType, strHeight, strWidth) {  

	  if (newWin != null && !newWin.closed)  
	
	    newWin.close();  
	
	  var strOptions="";  
	
	  if (strType=="console")  
	
	    strOptions="resizable,height="+  
	
	      strHeight+",width="+strWidth;  
	
	  if (strType=="fixed")  
	
	    strOptions="status,height="+  
	
	      strHeight+",width="+strWidth;  
	
	  if (strType=="elastic")  
	
	    strOptions="toolbar,menubar,scrollbars,"+  
	
	      "resizable,location,height="+  
	
	      strHeight+",width="+strWidth;  
	
	  newWin = window.open(strURL, 'newWin', strOptions);  
	
	  newWin.focus();  
	
	}
	function hide(el){
		$(el).parent().css('visibility','hidden');
		$(el).parent().css('opacity','0');
	}

	function showCatchments(el)
	{
		$(".dropdown li a").removeClass("active");
		clearLegend();
		$(el).addClass('active');
		local.setVisibility(false);

	}
	
	function showInfo(evt) {
    	console.log(evt);
    }
	var stored;
	function showLayer(el, key)
	{
				console.log($(".legend_toggle").prop("checked"))


		if($(".legend_toggle").prop("checked") === true){
			//null	
		}else {
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		enableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		console.log("BREAK");
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
		
		console.log("BREAKEST")
		
		if(upstream){
			upstream.setVisibility(true);
			map.removeLayer(upstream);
		}
		
		console.log("BREAKER")
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		
		var stl = setStyleWithRules(key, "Streams:NENY_NHDCatchments_LocalStats_2");
		//console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NENY_NHDCatchments_LocalStats_2',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		
		upstream = new OpenLayers.Layer.WMS(
			"upstream", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NENY_NHDCatchments_UpstreamStats',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + "_upstream.sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(enabled_layer == "local"){
				if(upstream){
					upstream.setVisibility(false);
							MapLoadTracker.addTracker(upstream, $(el).html() + " (Upstream)", true);

				}
				
				if(local){
					local.setVisibility(true);
							MapLoadTracker.addTracker(local, $(el).html(), false);

				}
			} else {
				if(upstream){
							MapLoadTracker.addTracker(upstream, $(el).html() + " (Upstream)", false);
				upstream.setVisibility(true);
				}
				
				if(local){
				local.setVisibility(false);
							MapLoadTracker.addTracker(local, $(el).html(), true);
				}
			}
		}
		


		//local.setVisibility(true);
		map.addLayers([local, upstream]);
		
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
		
	}
	
	function showModeledLayer(el, key)
	{
				console.log($(".legend_toggle").prop("checked"))

		if($(".legend_toggle").prop("checked") === true){
			//null	
		}else {
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		
		disableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		var stl = setStyleWithRules(key, "Streams:NENY_NHDCatchments_LocalStats_2");
		//console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:CatchmentSustTemp',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(upstream){
					upstream.setVisibility(false);
				}
				
				if(local){
					local.setVisibility(true);
				}
		}
		enabled_layer = 'local';
			


		//local.setVisibility(true);
		map.addLayers([local]);
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
				MapLoadTracker.addTracker(local, $(el).html());

	}
	
	
	function showEnvironmentLayer(el, key)
	{
		console.log($(".legend_toggle").prop("checked"))
		if($(".legend_toggle").prop("checked") === true){
			//null	
		}else {
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		disableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		
		var stl = setStyleWithRules(key, "Streams:StreamTempSites_865");
		console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:StreamTempSites_865',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(upstream){
					upstream.setVisibility(false);
				}
				
				if(local){
					local.setVisibility(true);
				}
		}
		enabled_layer = 'local';
			


		//local.setVisibility(true);
		map.addLayers([local]);
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
				MapLoadTracker.addTracker(local, $(el).html());

	}
	
	
	function showFlowLayer(el, key)
	{
		console.log($(".legend_toggle").prop("checked"))
		if($(".legend_toggle").prop("checked") === true){
			//null	
		}else {
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		disableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		
		var stl = setStyleWithRules(key, "Streams:Flow_Obs_12_2013");
		console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:Flow_Obs_12_2013',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(upstream){
					upstream.setVisibility(false);
				}
				
				if(local){
					local.setVisibility(true);
				}
		}
		enabled_layer = 'local';
			


		//local.setVisibility(true);
		map.addLayers([local]);
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
				MapLoadTracker.addTracker(local, $(el).html());

	}

	function showConnecticutBPLayers(el, key)
	{
		console.log("LOGLOGLOGLOGLOGLOGLOGLOG")
		console.log($(".legend_toggle").prop("checked"))

		if($(".legend_toggle").prop("checked") === true){
			//null	
			console.log("TRUETRUETRUE")
		}else {
			console.log("CFFFFFFALSE")
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		disableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		
		var stl = setStyleWithRules(key, "Streams:CT_BP_preds195_Website");
		console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:CT_BP_preds195_Website',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(upstream){
					upstream.setVisibility(false);
				}
				
				if(local){
					local.setVisibility(true);
				}
		}
		enabled_layer = 'local';
			


		//local.setVisibility(true);
		map.addLayers([local]);
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
				MapLoadTracker.addTracker(local, $(el).html());

	}
	
	function showFlowPolygonLayers(el, key)
	{
		console.log("LOGLOGLOGLOGLOGLOGLOGLOG")
		console.log($(".legend_toggle").prop("checked"))

		if($(".legend_toggle").prop("checked") === true){
			//null	
			console.log("TRUETRUETRUE")
		}else {
			console.log("CFFFFFFALSE")
			toggleLegend();
		}
		$(".legend_toggle").prop("checked", "true");
		disableUpstreamLocal();
		stored = $(el)
		console.log(el);
		$(".dropdown li a").removeClass("active");
		$(".workpanel li a").removeClass("active");
		$(el).addClass('active');
		console.log($(el));
		
		if($("#historic ul li").length > 7){
			$("#historic ul li")[6].remove();
		}
		var unique = true;
		var list_set = $("#historic ul li");
		for(var i = 0; i < list_set.length; i++){
			if(list_set[i].innerText == $(el).html()){
				unique = false;
			}
		}
		
		if(unique){
			var li = $("<li style='text-align: left;'><i class='icon-remove-circle' onclick='removeThis(this);' style='position: relative;left: 2px;top: 19px;float:left; margin-top:-14px'></i></li>");
			var a = $(el).clone();
			$(li).append(a);
				
			$("#historic ul").prepend(li);
		}
		
		
		//$(li).first();
		//catchment_1.setVisibility(false);
		//catchment_2.setVisibility(false);
		if(local){
			local.setVisibility(true);
			map.removeLayer(local);
		}
			

		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		
		var stl = setStyleWithRules(key, "Streams:flow_pred_hw_01_2014");
		console.log(stl);
		//map.removeLayer(flow_1);
		//map.removeLayer(flow_2);
		

		
		
		local = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:flow_pred_hw_01_2014',
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/" + key + ".sld",
				//sld_body:stl,
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		if(LAYER_OFF){
			//null
		} else {
			if(upstream){
					upstream.setVisibility(false);
				}
				
				if(local){
					local.setVisibility(true);
				}
		}
		enabled_layer = 'local';
			


		//local.setVisibility(true);
		map.addLayers([local]);
		map.setLayerIndex(local, 30);
		if(basin_layer)
			map.setLayerIndex(basin_layer, 50); //set the marker layer to an arbitrarily high layer index
			
		if(catchments)
			map.setLayerIndex(catchments, 49); //set the marker layer to an arbitrarily high layer index
		reDrawFlowlines();
				MapLoadTracker.addTracker(local, $(el).html());

	}
	
	function disableLegend(){
		$(".legend").removeClass("active");
		$(".legend_toggle").prop("checked", false);
	}


	function reDrawFlowlines()
	{
		var opac = 0.6;
		if(options.flowlines){
			opac = 0.6;
		} else {
			opac = 0;
		}
		
		map.setLayerIndex(flow_1, 48);
		map.setLayerIndex(flow_2, 47);
		
		/*
		flow_1 = new OpenLayers.Layer.WMS(
			"Streams:Catchment", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NHDFlowline',
				transparent: "true",
				format: format,
			},
			{
				isBaseLayer: false,
				opacity: opac,
			}
		);


		flow_2 = new OpenLayers.Layer.WMS(
			"Streams:Catchment", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:NHDFlowline_2',
				transparent: "true",
				format: format,
			},
			{
				isBaseLayer: false,
				opacity: opac,
			}
		);

		//flow_1.setVisibility(options.flowlines);
		//flow_2.setVisibility(options.flowlines);

		map.addLayers([local, flow_1, flow_2]);
		*/
	}

	function clearAll()
	{
		$(".dropdown li a").removeClass("active")

		for (var i = 0; i < layer_arr.length; i++)
		{
			layer_arr[i].setVisibility(false);
		}

	}

	function toggleLegend()
	{

		if ($(".legend").hasClass("active"))
		{
			$(".legend").removeClass("active");
		}
		else
		{
			$(".legend").addClass("active");
		}

	}


	function toggleFlowlines()
	{
		
		
		options.flowlines = !options.flowlines;
		
		
		if(flow_1.opacity == 0){
			flow_1.setOpacity(.6)
		} else {
			flow_1.setOpacity(0)
		}
		if(flow_2.opacity == 0){
			flow_2.setOpacity(.6)
		} else {
			flow_2.setOpacity(0)
		}
		

	}
	
	function toggleCatchments()
	{
		if(catchments.opacity == 0){
			catchments.setOpacity(1);
			catchment_opacity = 1;
		} else {
			catchments.setOpacity(0);
			catchment_opacity = 0;

		}
		
		console.log(catchments.opacity)
		
		
	}
	
	
	function toggleBasemap(){
		cur_basemap.setVisibility(!cur_basemap.getVisibility());
		if(cur_basemap.opacity == 0){
			cur_basemap.setOpacity(1);
		}else {
			cur_basemap.setOpacity(0);
		}
		
	}
	
	function setBasemap(l){
		cur_basemap = l;

	}

	function setOpacity(){
		if(local)
			local.setOpacity(opacity);
			
		if(upstream)
			upstream.setOpacity(opacity);
		
		if(test_layer)
			test_layer.setOpacity(opacity);
	}
	
	function toggleOptions()
	{
		if ($(".options").hasClass("active"))
		{
			$(".options").removeClass("active");
		}
		else
		{
			$(".options").addClass("active");
		}
	}

	function clearLegend()
	{
		$(".legend ul").remove();
		$(".l-label").html("");
		$(".l-sublabel").html("");
	}

	function setLayerCopy(key)
	{
		$('.layer-label').html("<input type='checkbox' style='margin-right:5px;margin-top: -4px;' onclick='toggleLayer()' checked='true'> " + key);
	}
	var w;
	function extractMenu(el){
		console.log(el);
		var data_pair = $(el).attr("data-link");
		console.log($("." + data_pair))
		if($(".workpanel").hasClass(data_pair)){
			return;
		}
		
		
		var panel = $("ul[data-link=" + data_pair + "]").clone();
		$(panel).css("display", "block");
		$(panel).css("padding","35px 35px");
		$(panel).css("width","auto")
		console.log(panel);
		
		var work_panel = $("<div class='workpanel " + data_pair + "'><i class='icon-remove-circle' onclick='removeThis(this)'></i></div>");
		$(work_panel).append(panel);
		$(work_panel).append("<h3>"+ $(el).html() + "</h3>")
		
		
		
		$(work_panel).css("top","200px");
		$(work_panel).css("left", "200px");
		
		
		$(work_panel).find('ul').css("top", "auto");
		
		var icon = $(work_panel).find(".icon-remove-circle");
		$(icon).css("top", "10px");
		
		
		
		
		
		
		$("body").append(work_panel);
		
		$(work_panel).draggable({
			containment:'parent'
		});
		
		
		var len = $(panel).css("width");
		len = len.split('px');
		
		console.log(len);
		
		var l_val = parseInt(len[0]);


		console.log(l_val);
		$(work_panel).find('i').css('left', l_val + 50);
		$(work_panel).css("height", $(work_panel).find('ul').outerHeight() + "px")
		
		
	}
	
	function removeThis(el){
		console.log(el);
		$(el).parent().remove();
	}
	
	function setBaseMap(basemap){
		//set all other basemaps to null
		
		basemap.setVis
		
		
	}
	
	function minimizeHistory(el){
		if($(el).hasClass("icon-resize-small")){
			$(el).removeClass("icon-resize-small");
			$(el).addClass("icon-resize-full");
			$(".layer-history").css("height","40px");
		} else {
			$(el).removeClass("icon-resize-full");
			$(el).addClass("icon-resize-small");
			$(".layer-history").css("height","auto");
		}
	}
	
	//REMOVE THESE WHEN DONE
	function kevinTestLayer(){
		if(test_layer){
			map.removeLayer(test_layer);
		}
		test_layer = new OpenLayers.Layer.WMS(
            "Streams:prj - Tiled", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:prj',
				transparent: "true",
				format: format,
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		map.addLayer(test_layer);
		
		var infoControls2 = {
            click: new OpenLayers.Control.WMSGetFeatureInfo({
                url: 'http://felek.cns.umass.edu:8080/geoserver/Streams/wms', 
                title: 'Identify features by clicking',
                layers: [test_layer],
                queryVisible: true,
                eventListeners: {
                getfeatureinfo: function(event) {
                	$("#f-pop").remove();
                   var p =  map.addPopup(new OpenLayers.Popup.FramedCloud(
                        "f-pop", 
                        map.getLonLatFromPixel(event.xy),
                       null,
                        event.text,
                        null,
                        true
                    ));
                    
                   console.log(p);
                }
            }
            })
           }
            
        for (var i in infoControls2) { 
            infoControls2[i].events.register("getfeatureinfo", this, showInfo);
            map.addControl(infoControls2[i]); 
        }
        
        infoControls2.click.activate();
		
	}
	
	function kevinTestLayer2(){
		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		test_layer = new OpenLayers.Layer.WMS(
            "Streams:prj - Tiled", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:prj_85',
				transparent: "true",
				format: format,
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		map.addLayer(test_layer);
	}
	
	function kevinImpervLayer(){
		if(test_layer){
			map.removeLayer(test_layer);
		}
		
		
		test_layer = new OpenLayers.Layer.WMS(
            "Streams:prj - Tiled", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:prj_imperv',
				transparent: "true",
				format: format,
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: opacity,
			}
		);
		
		map.addLayer(test_layer);
		
	}

	
	
	function destroy(el){
		$(el).parent().remove();
	}
	
	
	function toggleLayer(){
		
		LAYER_OFF = !LAYER_OFF;
		
		
		if(enabled_layer == 'local'){
			local.setVisibility(!local.getVisibility())
		} else {
			upstream.setVisibility(!upstream.getVisibility())
		}
	}
	
	function toggleOutline(lay, text){
		$("#outline .btn_label").html("Outline: " + text + " <span class=' icon-chevron-right'></span>");
		$(".outline_checkbox").prop("checked",true);
		catchment_opacity = 1;
		
		
		if(catchments){
			map.removeLayer(catchments);
		}
		
		catchments = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:' + lay,
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/Outline"+ lay + options.color  + ".sld",
				//sld_body: setStyleParams('Streams:ct_occ_resil'),
			},
			{
				isBaseLayer: false,
				opacity: catchment_opacity,
			}
		);
		MapLoadTracker.addTracker(catchments, "Outline", false);
		outline_layer = lay;
		
		map.addLayer(catchments);
	}
	
	function setBasemaptext(text){
		$("#basemap .btn_label").html("Basemap: " + text + " <span class=' icon-chevron-right'></span>");
	}
	
	function swapMaps(target){
		console.log(target);
		
		if(LAYER_OFF){
			return;
		}
		
		
		if(target == "local"){
			upstream.setVisibility(false);
			local.setVisibility(true);
		} else {
			upstream.setVisibility(true);
			local.setVisibility(false);
		}
	}
	
	function disableUpstreamLocal(){
		$("input[value='local']").prop("checked", true);
		$("input[value='upstream']").prop("checked", false);
		
		$("input[value='local']").css("pointer-events", "none");
		$("input[value='upstream']").css("pointer-events", "none");
		$("input[value='local']").parent().css("color", "grey");
		$("input[value='upstream']").parent().css("color", "grey");
	}
	
	function enableUpstreamLocal(){
		$("input[value='local']").css("pointer-events", "auto");
		$("input[value='upstream']").css("pointer-events", "auto");
		$("input[value='local']").parent().css("color", "black");
		$("input[value='upstream']").parent().css("color", "black");
	}
	
	function searchLocation(el){
		var address = ($(el).parent().find('input').val());
		if(address == ""){
			alert("Please Enter a Location Name")
			return;
		}
		geocoder = new google.maps.Geocoder();
		
		geocoder.geocode( { 'address': address}, function(results, status) {
			console.log(results);
			if (status == google.maps.GeocoderStatus.OK) {
		    	var latitude = results[0].geometry.location.nb;
		    	var longitude = results[0].geometry.location.ob;
		    	
		    	var lonlat_search = new OpenLayers.LonLat(longitude,latitude);
		    	var projWGS84 = new OpenLayers.Projection("EPSG:4326");
				var proj900913 = new OpenLayers.Projection("EPSG:900913");
                	
                lonlat_search = lonlat_search.transform(projWGS84, proj900913)
                
                
                var bound = new OpenLayers.Bounds();
                if(results[0].geometry.bounds != undefined){
	               	var coordA = new OpenLayers.LonLat(results[0].geometry.bounds.fa.b, results[0].geometry.bounds.ea.b) ;
	                var coordB = new OpenLayers.LonLat(results[0].geometry.bounds.fa.d, results[0].geometry.bounds.ea.d) ;
	                
	                console.log(coordA);
	                console.log(coordB);
	                
	                
	                coordA = coordA.transform(projWGS84, proj900913)
	                coordB = coordB.transform(projWGS84, proj900913)
	                
	                console.log(coordA);
	                console.log(coordB);
	                
	                
	                bound.extend(coordB);
	                bound.extend(coordA);
                } else {
                	var coordA = new OpenLayers.LonLat(results[0].geometry.viewport.fa.b, results[0].geometry.viewport.ea.b) ;
	                var coordB = new OpenLayers.LonLat(results[0].geometry.viewport.fa.d, results[0].geometry.viewport.ea.d) ;
	                
	                console.log(coordA);
	                console.log(coordB);
	                
	                
	                coordA = coordA.transform(projWGS84, proj900913)
	                coordB = coordB.transform(projWGS84, proj900913)
	                
	                console.log(coordA);
	                console.log(coordB);
	                
	                
	                bound.extend(coordB);
	                bound.extend(coordA);
                }
                
                
                bound.toBBOX();
                
                map.zoomToExtent(bound, true);
		    	//map.panTo(lonlat_search)
		    	console.log(bound)
		    	
		    } else {
		    	alert("There was a problem with your request.")
		    }
		}); 
		
	}
	
	
	function showSearch(){
		$(".search").css("visibility", "visible");
		
	}
	
	function showOptions(){
		$(".option").css("visibility", "visible");
		
	}
	
	function applyOptions(el){
		console.log("Applying options")
		
		//Change Catchment Outline Color
		console.log($(this).parent().find('.c-color').find(':selected'))
		var color = $(".c-color option:selected").val(); 
		if(catchments){
			map.removeLayer(catchments);
		}
		
		console.log(color);
		
		var c_ctyle = setCatchmentStyle("#FF0000", outline_layer);
		key = color;
		options.color = key;
		
		console.log(outline_layer);
		
		catchments = new OpenLayers.Layer.WMS(
			"local", "http://felek.cns.umass.edu:8080/geoserver/Streams/wms",
			{
				layers: 'Streams:' + outline_layer,
				transparent: "true",
				format: format,
				sld: "http://felek.cns.umass.edu:8080/geoserver/www/data_viewer/data/sld/Outline"+ outline_layer + key  + ".sld",
				//sld_body: c_ctyle,
			},
			{
				isBaseLayer: false,
				opacity: catchment_opacity,
			}
		);
		
		
		map.addLayer(catchments);
	}
	
	
	function toggleClass(el, newClass){
		if($(el).hasClass(newClass)){
			$(el).removeClass(newClass);
		} else {
			$(el).addClass(newClass);
		}
	}
	
	
