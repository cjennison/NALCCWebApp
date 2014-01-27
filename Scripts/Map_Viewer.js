function init() {
	$.support.cors = true;
	x = mapSize();
	document.getElementById("noScript").style.display = "none";

//********OpenLayers Map**********
       //bounds = new OpenLayers.Bounds(-2493045, 177285, 2342655, 3310005);
       bounds = new OpenLayers.Bounds(-14000000, 2800000, -7350000, 6450000);
       maxBounds = new OpenLayers.Bounds(-20037508.34, -20037508.34, 20037508.34, 20037508.34);
	//EPSG: 5071
	//projFrom = 'PROJCS["NAD83(HARN) / Conus Albers", GEOGCS["NAD83(HARN)", DATUM["NAD83 (High Accuracy Reference Network)", SPHEROID["GRS 1980", 6378137.0, 298.257222101, AUTHORITY["EPSG","7019"]], TOWGS84[-0.991, 1.9072, 0.5129, 0.0257899075194932, -0.009650098960270402, -0.011659943232342112, 0.0], AUTHORITY["EPSG","6152"]], PRIMEM["Greenwich", 0.0, AUTHORITY["EPSG","8901"]], UNIT["degree", 0.017453292519943295], AXIS["Geodetic longitude", EAST], AXIS["Geodetic latitude", NORTH], AUTHORITY["EPSG","4152"]], PROJECTION["Albers_Conic_Equal_Area", AUTHORITY["EPSG","9822"]], PARAMETER["central_meridian", -96.0], PARAMETER["latitude_of_origin", 23.0], PARAMETER["standard_parallel_1", 29.5], PARAMETER["false_easting", 0.0], PARAMETER["false_northing", 0.0], PARAMETER["standard_parallel_2", 45.5], UNIT["m", 1.0], AXIS["Easting", EAST], AXIS["Northing", NORTH], AUTHORITY["EPSG","5071"]]'
	//EPSG: 900913
	projFrom = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0+k=1.0 +units=m +nadgrids=@null +no_defs";
	//EPSG: 4326
	projTo = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";

       //options = {controls: [], allOverlays: true, maxExtent: bounds, maxResolution: "auto", maxScale: 30000000, minScale: 1000, numZoomLevels: 50, projection: "EPSG:5071", units: "m"};
       //options = {controls: [], allOverlays: true, maxExtent: bounds, maxResolution: "auto", maxScale: 30000000, minScale: 1000, numZoomLevels: 50, projection: "EPSG:3857", units: "m"};
       options = {controls: [], allOverlays: true, numZoomLevels: 25, projection: "EPSG:900913", units: "m"};

       map = new OpenLayers.Map('mapViewer', options);

//********WMS layers**********
	layerVar = [];  //Enter the variable name of the layer
	layerNS = [];   //Enter in the Geoserver workspace and layer name
	layerType = []; //Enter either raster or point or line or polygon
	legSpec = [];   //Enter Scale rules for legend graphics
	uniqueID = [];	//Enter unique polygon identifier for polygon layers
	radioID = "formSelectId-All Layers";
	radioFS = null;
	dloadIndex = -1;
	saveTypeIndex = 0;
	projIndex = 0;
	dlExtent = true;
	rpccr_id = []; //Enters names of rpccr layers when added by user
	rpccr_file_name = [];
	rpccrLayers = [];
	rpccrSFLayer = "";
	rpccrSFNum = -1;
	oid = [];

        imagery = new OpenLayers.Layer.XYZ("Imagery",
            [
            "http://otile1.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.png",
            "http://otile2.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.png",
            "http://otile3.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.png",
            "http://otile4.mqcdn.com/tiles/1.0.0/sat/${z}/${x}/${y}.png"
            ],
            {transitionEffect: "resize",
	     attribution: "Tiles Courtesy of <a href='http://open.mapquest.co.uk/' target='_blank'>MapQuest</a>. Portions Courtesy NASA/JPL-Caltech and U.S. Depart. of Agriculture, Farm Service Agency. <img src='http://developer.mapquest.com/content/osm/mq_logo.png' border='0'>"}
            );
            layerVar.push(imagery);
	    layerNS.push("EBTJV:imagery");
	    layerType.push("tile");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(imagery);

	streetMap = new OpenLayers.Layer.XYZ("Street Map", 
            [
                "http://otile1.mqcdn.com/tiles/1.0.0/map/${z}/${x}/${y}.png",
                "http://otile2.mqcdn.com/tiles/1.0.0/map/${z}/${x}/${y}.png",
                "http://otile3.mqcdn.com/tiles/1.0.0/map/${z}/${x}/${y}.png",
                "http://otile4.mqcdn.com/tiles/1.0.0/map/${z}/${x}/${y}.png"
            ],
            {transitionEffect: "resize",
	     attribution: "Data, imagery and map information provided by <a href='http://www.mapquest.com/'  target='_blank'>MapQuest</a>, <a href='http://www.openstreetmap.org/' target='_blank'>Open Street Map</a> and contributors, <a href='http://creativecommons.org/licenses/by-sa/2.0/' target='_blank'>CC-BY-SA</a>  <img src='http://developer.mapquest.com/content/osm/mq_logo.png' border='0'>"}
            );
            layerVar.push(streetMap);
	    layerNS.push("EBTJV:streetMap");
	    layerType.push("tile");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(streetMap);
            streetMap.setVisibility(false);

	/*streetMap = new OpenLayers.Layer.OSM("Street Map",
           ["http://a.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png",
           "http://b.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png",
           "http://c.tile.opencyclemap.org/cycle/${z}/${x}/${y}.png"]);
            layerVar.push(streetMap);
	    layerNS.push("EBTJV:streetMap");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(streetMap);*/

        landCov = new OpenLayers.Layer.WMS( "Land Cover",
           "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
           {layers: 'EBTJV:lan_cov_06_resampled', format: "image/png", transparent: true}
	    );
	    layerVar.push(landCov);
	    layerNS.push("EBTJV:lan_cov_06_resampled");
	    layerType.push("raster");
	    legSpec.push("none");
           uniqueID.push("");
	    map.addLayer(landCov);
	    landCov.setVisibility(false);

        surfLith = new OpenLayers.Layer.WMS( "Surficial Lithology",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:surf_lith_10", format: "image/png", transparent: true}
            );
	    layerVar.push(surfLith);
	    layerNS.push("EBTJV:surf_lith_10");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(surfLith);
	    surfLith.setVisibility(false);

        elevation = new OpenLayers.Layer.WMS( "Elevation",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:ned_10_resampled", format: "image/png", transparent: true} 
            );
	    layerVar.push(elevation);
	    layerNS.push("EBTJV:ned_10_resampled");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(elevation);
	    elevation.setVisibility(false);

        baseFlow = new OpenLayers.Layer.WMS( "Base Flow Index",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:base_flow_03", format: "image/png", transparent: true} 
            );
	    layerVar.push(baseFlow);
	    layerNS.push("EBTJV:base_flow_03");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(baseFlow);
            baseFlow.setVisibility(false);

        precip = new OpenLayers.Layer.WMS( "Mean Precipitation",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:precip_1981_2010", format: "image/png", transparent: true} 
            );
	    layerVar.push(precip);
	    layerNS.push("EBTJV:precip_1981_2010");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(precip);
            precip.setVisibility(false);

        tempMax = new OpenLayers.Layer.WMS( "Mean Max Temperature",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:temp_max_1981_2010", format: "image/png", transparent: true} 
            );
	    layerVar.push(tempMax);
	    layerNS.push("EBTJV:temp_max_1981_2010");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(tempMax);
	    tempMax.setVisibility(false);

        tempMin = new OpenLayers.Layer.WMS( "Mean Min Temperature",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:temp_min_1981_2010", format: "image/png", transparent: true} 
            );
	    layerVar.push(tempMin);
	    layerNS.push("EBTJV:temp_min_1981_2010");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(tempMin);
	    tempMin.setVisibility(false);

        no3dep = new OpenLayers.Layer.WMS( "NO3 Deposition",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:no3_dep_11", format: "image/png", transparent: true}
            );
	    layerVar.push(no3dep);
	    layerNS.push("EBTJV:no3_dep_11");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(no3dep);
            no3dep.setVisibility(false);

        so4dep = new OpenLayers.Layer.WMS( "SO4 Deposition",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:so4_dep_11", format: "image/png", transparent: true}
            );
	    layerVar.push(so4dep);
	    layerNS.push("EBTJV:so4_dep_11");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(so4dep);
	    so4dep.setVisibility(false);

        canCov = new OpenLayers.Layer.WMS( "Canopy Cover",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:can_cov_01", format: "image/png", transparent: true} 
            );
	    layerVar.push(canCov);
	    layerNS.push("EBTJV:can_cov_01");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(canCov);
            canCov.setVisibility(false);

        solGain = new OpenLayers.Layer.WMS( "Solar Gain",
             "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:solar_gain_resampled", format: "image/png", transparent: true} 
            );
	    layerVar.push(solGain);
	    layerNS.push("EBTJV:solar_gain_resampled");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(solGain);
            solGain.setVisibility(false);

        impSur = new OpenLayers.Layer.WMS( "Impervious Surface",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:imp_sur_06_resampled", format: "image/png", transparent: true} 
            );
	    layerVar.push(impSur);
	    layerNS.push("EBTJV:imp_sur_06_resampled");
	    layerType.push("raster");
	    legSpec.push("none");
            uniqueID.push("");
	    map.addLayer(impSur);
	    impSur.setVisibility(false);

        USstates = new OpenLayers.Layer.WMS( "US States",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:US_States", format: "image/png", transparent: true} 
            );
	    layerVar.push(USstates);
	    layerNS.push("EBTJV:US_States");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("STATE");
	    map.addLayer(USstates);

        states = new OpenLayers.Layer.WMS( "EBTJV States",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:EBTJV_States", format: "image/png", transparent: true} 
            );
	    layerVar.push(states);
	    layerNS.push("EBTJV:EBTJV_States");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("STATE");
	    map.addLayer(states);
	    states.setVisibility(false);

        rivers = new OpenLayers.Layer.WMS( "Major Rivers",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:US_Rivers", format: "image/png", transparent: true} 
            );
	    layerVar.push(rivers);
	    layerNS.push("EBTJV:US_Rivers");
	    layerType.push("line");
	    legSpec.push("&SCALE=2000000");
            uniqueID.push("");
	    map.addLayer(rivers);
	    rivers.setVisibility(false);

        streams = new OpenLayers.Layer.WMS( "Streams",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:NHDPlus2_Streams", format: "image/png", transparent: true} 
            );
	    layerVar.push(streams);
	    layerNS.push("EBTJV:NHDPlus2_Streams");
	    layerType.push("line");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("");
	    map.addLayer(streams);
	    streams.setVisibility(false);

        corridor = new OpenLayers.Layer.WMS( "100 M Stream Corridor",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:EBTJV_NHD_corridor", format: "image/png", transparent: true} 
            );
	    layerVar.push(corridor);
	    layerNS.push("EBTJV:EBTJV_NHD_corridor");
	    layerType.push("polygon");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("COMID");
	    map.addLayer(corridor);
	    corridor.setVisibility(false);

        waterbodies = new OpenLayers.Layer.WMS( "Waterbodies",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:NHDPlus_Waterbodies", format: "image/png", transparent: true} 
            );
	    layerVar.push(waterbodies);
	    layerNS.push("EBTJV:NHDPlus_Waterbodies");
	    layerType.push("polygon");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("");
	    map.addLayer(waterbodies);
	    waterbodies.setVisibility(false);

        primRoads = new OpenLayers.Layer.WMS( "Primary Roads",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:US_Primary_Roads_2012", format: "image/png", transparent: true} 
            );
	    layerVar.push(primRoads);
	    layerNS.push("EBTJV:US_Primary_Roads_2012");
	    layerType.push("line");
	    legSpec.push("&SCALE=2000000");
            uniqueID.push("");
	    map.addLayer(primRoads);
	    primRoads.setVisibility(false);

        secRoads = new OpenLayers.Layer.WMS( "Secondary Roads",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:US_Secondary_Roads_2012", format: "image/png", transparent: true} 
            );
	    layerVar.push(secRoads);
	    layerNS.push("EBTJV:US_Secondary_Roads_2012");
	    layerType.push("line");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("");
	    map.addLayer(secRoads);
	    secRoads.setVisibility(false);

        catchments = new OpenLayers.Layer.WMS( "NHDPlus Catchments",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:NHDPlus_Catchments", format: "image/png", transparent: true} 
            );
	    layerVar.push(catchments);
	    layerNS.push("EBTJV:NHDPlus_Catchments");
	    layerType.push("polygon");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("OBJECTID");
	    map.addLayer(catchments);
	    catchments.setVisibility(false);

        coded_catchments = new OpenLayers.Layer.WMS( "Coded Catchments",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:catchments_merged_hudy_2012", format: "image/png", transparent: true} 
            );
	    layerVar.push(coded_catchments);
	    layerNS.push("EBTJV:catchments_merged_hudy_2012");
	    layerType.push("polygon");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("OBJECTID");
	    map.addLayer(coded_catchments);
	    coded_catchments.setVisibility(false);

        huc12 = new OpenLayers.Layer.WMS( "HUC 12",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:HUC_12", format: "image/png", transparent: true} 
            );
	    layerVar.push(huc12);
	    layerNS.push("EBTJV:HUC_12");
	    layerType.push("polygon");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("OBJECTID");
	    map.addLayer(huc12);
	    huc12.setVisibility(false);

        huc10 = new OpenLayers.Layer.WMS( "HUC 10",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:HUC_10", format: "image/png", transparent: true} 
            );
	    layerVar.push(huc10);
	    layerNS.push("EBTJV:HUC_10");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("OBJECTID");
	    map.addLayer(huc10);
	    huc10.setVisibility(false);

        huc8 = new OpenLayers.Layer.WMS( "HUC 8",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:HUC_8", format: "image/png", transparent: true} 
            );
	    layerVar.push(huc8);
	    layerNS.push("EBTJV:HUC_8");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("OBJECTID");
	    map.addLayer(huc8);
	    huc8.setVisibility(false);

        huc6 = new OpenLayers.Layer.WMS( "HUC 6",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:HUC_6", format: "image/png", transparent: true} 
            );
	    layerVar.push(huc6);
	    layerNS.push("EBTJV:HUC_6");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("OBJECTID");
	    map.addLayer(huc6);
	    huc6.setVisibility(false);

        patches = new OpenLayers.Layer.WMS( "BKT Patches",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:BKT_Patches_Feb_13", format: "image/png", transparent: true} 
            );
	    layerVar.push(patches);
	    layerNS.push("EBTJV:BKT_Patches_Feb_13");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("OBJECTID");
	    map.addLayer(patches);
            patches.setVisibility(false);

        vulPatches = new OpenLayers.Layer.WMS( "BKT Patch Vulnerability",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:Patch_Vulnerability_2005", format: "image/png", transparent: true} 
            );
	    layerVar.push(vulPatches);
	    layerNS.push("EBTJV:Patch_Vulnerability_2005");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("Population");
	    map.addLayer(vulPatches);
	    vulPatches.setVisibility(false);

        boundary = new OpenLayers.Layer.WMS( "EBTJV Boundary",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:EBTJV_Boundary", format: "image/png", transparent: true} 
            );
	    layerVar.push(boundary);
	    layerNS.push("EBTJV:EBTJV_Boundary");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("Id");
	    map.addLayer(boundary);

        chesBay = new OpenLayers.Layer.WMS( "Chesapeake Bay Boundary",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:Chesapeake_Bay_Boundary", format: "image/png", transparent: true} 
            );
	    layerVar.push(chesBay);
	    layerNS.push("EBTJV:Chesapeake_Bay_Boundary");
	    layerType.push("polygon");
	    legSpec.push("none");
            uniqueID.push("REGION");
	    map.addLayer(chesBay);
	    chesBay.setVisibility(false);

        dams = new OpenLayers.Layer.WMS( "Dams",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:NABD_2012", format: "image/png", transparent: true} 
            );
	    layerVar.push(dams);
	    layerNS.push("EBTJV:NABD_2012");
	    layerType.push("point");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("");
	    map.addLayer(dams);
            dams.setVisibility(false);

        mines = new OpenLayers.Layer.WMS( "Mines",
            "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", 
            {layers: "EBTJV:Mines_2003", format: "image/png", transparent: true} 
            );
	    layerVar.push(mines);
 	    layerNS.push("EBTJV:Mines_2003");
	    layerType.push("point");
	    legSpec.push("&SCALE=1000");
            uniqueID.push("");
	    map.addLayer(mines);
	    mines.setVisibility(false);

//********WFS layers**********
	selectStyle = new OpenLayers.Style({"fillColor": "#00FFFF", "fillOpacity": 0.6, "strokeColor": "#00FFFF", "strokeOpacity": 1.0, "strokeWidth": 2, "pointRadius": 7.5});
	featureLayer = new OpenLayers.Layer.Vector("Selected Features", {
            displayInLayerSwitcher: false, 
            isBaseLayer: false,
            styleMap: selectStyle
            });
            map.addLayer(featureLayer);

	hoverLayer = new OpenLayers.Layer.Vector("Hovered Features", {
            displayInLayerSwitcher: false, 
            isBaseLayer: false 
            });
            map.addLayer(hoverLayer);

	//*********Example WFS data layer
	/*patchesWFS = new OpenLayers.Layer.Vector(
           "WFS Patches", {
           strategies: [new OpenLayers.Strategy.BBOX()],
           protocol: new OpenLayers.Protocol.WFS({
             url: "http://felek.cns.umass.edu:8080/geoserver/wfs",
             featureType: "BKT_Patches",
             featureNS: "http://felek.cns.umass.edu:8080/geoserver/EBTJV"
             })
           });*/

//******Map Controls*******
	extPanel = new OpenLayers.Control.Panel({div: document.getElementById("controlPanel")});
	map.addControl(extPanel);

	control_zoom_in = new OpenLayers.Control.ZoomIn({title: "Fixed Zoom In"});
	control_zoom_out = new OpenLayers.Control.ZoomOut({title: "Fixed Zoom Out"});
	maxExtent = new OpenLayers.Control.ZoomToMaxExtent({title: "Zoom to Max Extent"});
	zoomBox = new OpenLayers.Control.ZoomBox({title: "Zoom In Select"});
	zoomBoxOut = new OpenLayers.Control.ZoomBox({title: "Zoom Out Select", out: true, displayClass: "olControlZoomBoxOut"});
	navPan = new OpenLayers.Control.Navigation({title: "Pan", dragPanOptions: {enableKinetic: true}, zoomWheelEnabled: true, documentDrag: true});
	identify = new OpenLayers.Control.WMSGetFeatureInfo({title: "Identify Features", url: "http://felek.cns.umass.edu:8080/geoserver/EBTJV/wms", queryVisible: true, 
		eventListeners: {
			getfeatureinfo: function(event) {
				gfDiv = document.getElementById("get_feature");
				
				for (var i=gfDiv.childNodes.length - 1; i>=0; i--) {
					gfDiv.removeChild(gfDiv.childNodes[i]);
					}
				gfDiv.style.padding = "0px";
				gfExit = document.createElement("img");
				gfExit.src = "Images/exit2_small.png";
				gfExit.setAttribute("onclick", "document.getElementById('get_feature').style.visibility = 'hidden'");
				gfExit.id = "gfExit";
				gfExit.setAttribute("onmouseover", "selCursor(this.id)");
				gfExit.style.position = "absolute";
				gfExit.style.right = "0px";
				gfExit.style.top = "0px";
				gfExit.style.margin = "2px";
				gfDiv.appendChild(gfExit);
				breakP = document.createElement("p");
				breakP.innerHTML = "<br>";
				breakP.style.margin = "0px";
				gfDiv.appendChild(breakP);
				gfBar = document.createElement("hr");
				gfDiv.appendChild(gfBar);
				gfDiv2 = document.createElement("div");
				gfDiv2.style.overflowX = "auto";
				gfDiv2.style.overflowY = "auto";
				gfP = document.createElement("p");
				gfP.style.margin = "5px";
				gfDiv2.appendChild(gfP);
				gfDiv.appendChild(gfDiv2);
				breakP = document.createElement("p");
				breakP.innerHTML = "<br>";
				breakP.style.margin = "0px";
				gfDiv.appendChild(breakP);

				gfP.innerHTML = event.text;
				gfDiv2.style.height = gfDiv.offsetHeight - 32 + "px";
				gfDiv.style.visibility = "visible";
                		}
			}
		});

	IdLayer = new OpenLayers.Control.Button({id: "IdLayerSelect", title: "Choose Layer to Identify", displayClass: "olControlIdLayer", trigger: getIdLayer});

	selFeat = new OpenLayers.Control.GetFeature({
		title: "Select Features",
		displayClass: "olControlGetFeature",
                protocol: OpenLayers.Protocol.WFS.fromWMSLayer(boundary),
                box: true,
                hover: false, 
                multipleKey: "shiftKey",
                toggleKey: "ctrlKey"
            });
            selFeat.events.register("featureselected", this, function(e) {
                featureLayer.addFeatures([e.feature]);
		attributes = e.feature.attributes; 
		for(var j in attributes) {
			tmpStr = JSON.stringify([j, attributes[j]]);
    			a = tmpStr.indexOf(",");
			str = (tmpStr.substr(2,a-3));
			if (str == uniqueID[rpccrSFNum]) {
				if (isNaN(tmpStr.slice(a+2,-2)) == false) {
					oid.push({"oid": Number(tmpStr.slice(a+2,-2))});
					}
				else {
					oid.push({"oid": tmpStr.slice(a+2,-2)});
					}
				break;
				}
			}
            });
            selFeat.events.register("featureunselected", this, function(e) {
              featureLayer.removeFeatures([e.feature]);
		attributes = e.feature.attributes; 
		for(var j in attributes) {
			tmpStr = JSON.stringify([j, attributes[j]]);
    			a = tmpStr.indexOf(",");
			str = (tmpStr.substr(2,a-3));
			if (str == uniqueID[rpccrSFNum]) {
				for (var i=0; i<oid.length; i++) {
					if (isNaN(tmpStr.slice(a+2,-2)) == false) {
						if (JSON.stringify(oid[i]) == '{"oid":' + Number(tmpStr.slice(a+2,-2)) + '}') {
							oid.splice(i, 1);
							}
						}
					else {
						if (JSON.stringify(oid[i]) == '{"oid":"' + tmpStr.slice(a+2,-2) + '"}') {
							oid.splice(i, 1);
							}
						}
					break;
					}
				}
			}
            });
            selFeat.events.register("hoverfeature", this, function(e) {
                hoverLayer.addFeatures([e.feature]);
            });
            selFeat.events.register("outfeature", this, function(e) {
                hoverLayer.removeFeatures([e.feature]);
            });

	selFeatLayer = new OpenLayers.Control.Button({id: "FSLayerSelect", title: "Choose Layer for Feature Select", displayClass: "olControlFSLayer", trigger: getFSLayer});
	unSelFeat = new OpenLayers.Control.Button({title: "Clear Selected Features", displayClass: "olControlClear", trigger: clearSelFeat});
	dLoad = new OpenLayers.Control.Button({id: "dloadButton", title: "Download Layers", displayClass: "olControlDownload", trigger: getDownload});
	ripLayer = new OpenLayers.Control.Button({id: "riparianButton", title: "Riparian Prioritization for Climate Change Resilience (RPCCR) Tool", displayClass: "olControlRiparian", trigger: getRiparian});
	goCoords = new OpenLayers.Control.Button({id: "coordsButton", title: "Zoom to specified coordinates", displayClass: "olControlCoords", trigger: goToCoords});

	navHistory = new OpenLayers.Control.NavigationHistory({displayClass: "olControlNavHist"});
	navHistory.previous.title = "Previous Extent";
	navHistory.next.title = "Next Extent";

	map.addControl(control_zoom_in);
	map.addControl(control_zoom_out);
	map.addControl(maxExtent);
	map.addControl(zoomBox);
	map.addControl(zoomBoxOut);
	map.addControl(navPan);
	map.addControl(navHistory);
	map.addControl(identify);
	map.addControl(IdLayer);
	map.addControl(selFeat);
	map.addControl(selFeatLayer);
	map.addControl(unSelFeat);
	map.addControl(dLoad);
	map.addControl(ripLayer);
	map.addControl(goCoords);

	extPanel.addControls([control_zoom_in, control_zoom_out, maxExtent, zoomBox, zoomBoxOut, goCoords, navPan, navHistory.previous, navHistory.next, identify, IdLayer, selFeat, selFeatLayer, unSelFeat, dLoad, ripLayer]);
	
	navPan.deactivate();
	navPan.activate();

        map.addControl(new OpenLayers.Control.Attribution());
        map.addControl(new OpenLayers.Control.ArgParser());
        //map.addControl(new OpenLayers.Control.MousePosition({div: document.getElementById("location")}));

	map.events.register("mousemove", map, function(e) {
	    position = map.getLonLatFromViewPortPx(e.xy).toString();
	    posArray = position.split(",");
	    tmpXEquals = posArray[0].indexOf("=") + 1;
	    tmpYEquals = posArray[1].indexOf("=") + 1;
	    lonX = parseFloat(posArray[0].substr(tmpXEquals, posArray[0].length));
	    latY = parseFloat(posArray[1].substr(tmpYEquals, posArray[1].length));
	    mousePoint = [parseFloat(lonX), parseFloat(latY)];
	    tmpLoc = proj4(projFrom, projTo, mousePoint).toString();
	    tmpLocArray = tmpLoc.split(",");
	    shortPoint = parseFloat(tmpLocArray[0]).toFixed(3) + " " + parseFloat(tmpLocArray[1]).toFixed(3);
            OpenLayers.Util.getElement("location").innerHTML = shortPoint;
            });

	//map.events.register("click", map, function(e) {
	//   alert(e.xy);
	//   });

       map.addControl(new OpenLayers.Control.ScaleLine({div: document.getElementById("scaleline-id")}));
       map.addControl(new OpenLayers.Control.Scale("scale-id"));
	//map.addControl(new OpenLayers.Control.NavToolbar());
       //map.addControl(new OpenLayers.Control.PanZoom());
       //map.addControl(new OpenLayers.Control.LayerSwitcher({title: "Add/remove layers", div: document.getElementById("legend")}));
       //map.addControl(new OpenLayers.Control.Navigation({dragPanOptions: {enableKinetic: true}, zoomWheelEnabled: true}));
       //map.addControl(new OpenLayers.Control.NavigationHistory());
       //map.addControl(new OpenLayers.Control.KeyboardDefaults());
	//map.addControl(new OpenLayers.Control.Graticule());
	
       map.setOptions({restrictedExtent: maxBounds});
       map.zoomToExtent(bounds);
	createLegend();
	rpccr_socket();
}

function mapSize() {
	w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

	temp = document.getElementById("mapViewer");
	temp.style.width = w - document.getElementById("legend").offsetWidth + "px";
	temp.style.height = h - document.getElementById("panelContainer").offsetHeight - document.getElementById("measures").offsetHeight + "px";
	
	temp = document.getElementById("panelContainer");
	temp.style.width = w - document.getElementById("legend").offsetWidth + "px";

	temp = document.getElementById("measures");
	temp.style.width = w - document.getElementById("legend").offsetWidth + "px";
	
	tempSL = document.getElementById("scaleline-id");
	tempSL.style.left = (temp.offsetWidth - tempSL.offsetWidth)/2 + "px";
	}