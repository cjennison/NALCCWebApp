var io = require('socket.io');
var express = require('express');

var app = express()
  , server = require('http').createServer(app)
  , io = io.listen(server);

app.use(express.bodyParser());

server.listen(3412);

io.sockets.on('connection', function (socket) {

	socket.on('get_rid', function (input) {
		console.log("");
		console.log("Acquiring rid values from solar_gain_cor_resampled contained within the selected polygon feature(s)");
		var layer = input.layer;
		console.log(JSON.stringify(input));
		var id_field = input.id_field;
		var oid = input.oid;

		var pg = require('pg');

		var tmpOid = "";
		for (var i=0; i<oid.length; i++) {
			if (i == 0) {
				tmpOid = " (b." + id_field + " = '" + oid[0].oid + "'";
				}
			else {
				tmpOid += " or b." + id_field + " = '" + oid[i].oid + "'";
				}
			}
		tmpOid += ")";
	
		var conString = 'postgres://Jason:Jason20!@felek.cns.umass.edu:5432/Riparian';
	
		var tmpQuery = "SELECT a.rid FROM solar_gain_cor_resampled a, " + layer + " b WHERE " + tmpOid + " and ST_Intersects(a.rast, b.geom) = 't';"
		console.log(tmpQuery);

		var client = new pg.Client(conString);
		client.connect(function(err) {
			if(err) {
				console.error('could not connect to postgres', err);
				socket.emit('error', {'error': err});
				}
			client.query(tmpQuery, function(err, result) {
				if(err) {
					console.error('error running query', err);
					socket.emit('error', {'error': err});
					}
				var tmpData = result.rows;
				client.end();

				console.log("Successfully acquired raster rid values: " + JSON.stringify(tmpData));
				socket.emit('get_rid', tmpData);
				});
			});
		});

	socket.on('solar_gain_percentile', function (input) {
		console.log("");
		console.log("Acquiring solar gain distribution from solar_gain_cor_resampled to determine value that corresponds with user-specified percentile");
		var layer = input.layer;
		var id_field = input.id_field;
		var oid = input.oid;
		var rid = input.rid;
		var solgain = input.solgain;

		var pg = require('pg');
	
		var tmpOid = "";
		for (var i=0; i<oid.length; i++) {
			if (i == 0) {
				tmpOid = " (b." + id_field + " = '" + oid[0].oid + "'";
				}
			else {
				tmpOid += " or b." + id_field + " = '" + oid[i].oid + "'";
				}
			}
		tmpOid += ")";
	
		var tmpRid = "";
		for (var i=0; i<rid.length; i++) {
			if (i == 0) {
				tmpRid = " and (a.rid = " + rid[0].rid;
				}
			else {
				tmpRid += " or a.rid = " + rid[i].rid;
				}
			}
		tmpRid += ")";

		var conString = 'postgres://Jason:Jason20!@felek.cns.umass.edu:5432/Riparian';
	
		var tmpQuery = "SELECT (tmpvals).value, sum((tmpVals).count) as count FROM (SELECT ST_ValueCount(ST_Clip(a.rast,b.geom), 1, true) As tmpVals FROM solar_gain_cor_resampled a, " + layer + " b WHERE " + tmpOid + tmpRid + ") as foo GROUP BY (tmpvals).value ORDER BY (tmpvals).value;"
		console.log(tmpQuery);

		var client = new pg.Client(conString);
		client.connect(function(err) {
			if(err) {
				console.error('could not connect to postgres', err);
				socket.emit('error', {'error': err});
				}
			client.query(tmpQuery, function(err, result) {
				if(err) {
					console.error('error running query', err);
					socket.emit('error', {'error': err});
					}
				var tmpData = result.rows;
				client.end();
			
				totpix = 0;
				for (var i=0; i<tmpData.length; i++) {
					totpix += parseInt(tmpData[i].count);
					}

				var tmpVal = Math.round(totpix * (solgain/100));

				var tmpCnt = 0;
				for (var i=0; i<tmpData.length; i++) {
					tmpCnt += parseInt(tmpData[i].count);
					if (tmpCnt >= tmpVal) {
						break;
						}
					}
					
				var retData = {"value": tmpData[i].value};

				console.log("Successfully acquired solar gain value corresponding with user-specified percentile: " + tmpData[i].value);
				socket.emit('solar_gain_percentile', retData);
				});
			});
		});

	socket.on('map_algebra', function (input) {
		console.log("");
		console.log(Date() + " Performing map algebra using user-specified values");
		var layer = input.layer;
		var id_field = input.id_field;
		var oid = input.oid;
		var rid = input.rid;
		var solgain = input.solgain;
		var solgainval = input.solgainval;
		var cancov = input.cancov;
		var el = input.el;
		var eluse = input.eluse
		var impsur = input.impsur;
		var impsuruse = input.impsuruse;
		var file_name = input.file_name;
	
		var pg = require('pg');
		var fs = require('fs');

		var tmpOid = "";
		for (var i=0; i<oid.length; i++) {
			if (i == 0) {
				tmpOid = " (b." + id_field + " = '" + oid[0].oid + "'";
				}
			else {
				tmpOid += " or b." + id_field + " = '" + oid[i].oid + "'";
				}
			}
		tmpOid += ")";
	
		var tmpRid = "";
		for (var i=0; i<rid.length; i++) {
			if (i == 0) {
				tmpRid = " and (a.rid = " + rid[0].rid;
				}
			else {
				tmpRid += " or a.rid = " + rid[i].rid;
				}
			}
		tmpRid += ")";

		var conString = 'postgres://Jason:Jason20!@felek.cns.umass.edu:5432/Riparian';
		
		if (eluse == true && impsuruse == true) {
			var tmpQuery = "SELECT ST_AsTIFF(ma3) as tiffvals FROM (SELECT ST_MapAlgebra(isUnion, ma2, '(CASE WHEN [rast1] <= " + impsur + " and [rast2] = 101 THEN 101 ELSE 100 END::int)') as ma3 FROM (SELECT ST_Union(isClip) as isUnion FROM (SELECT ST_Clip(a.rast, b.geom) as isClip FROM imp_sur_06_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo8) as foo9, (SELECT ST_MapAlgebra(elUnion, ma1, '(CASE WHEN [rast1] >= " + el + " and [rast2] = 101 THEN 101 ELSE 100 END::int)') as ma2 FROM (SELECT ST_Union(elClip) as elUnion FROM (SELECT ST_Clip(a.rast, b.geom) as elClip FROM ned_10_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo6) as foo7, (SELECT ST_MapAlgebra(sgUnion, ccUnion, '(CASE WHEN [rast1] >= " + solgainval + " and [rast2] <= " + cancov + " THEN 101 ELSE 100 END::int)') as ma1 FROM (SELECT ST_Union(sgClip) as sgUnion FROM (SELECT ST_Clip(a.rast,b.geom) as sgClip FROM solar_gain_cor_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo) as foo2, (SELECT ST_Union(ccClip) as ccUnion FROM (SELECT ST_Clip(a.rast,b.geom) as ccClip FROM can_cov_01 a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo3) as foo4) as foo5) as foo10) as foo11;";
			}
		else if (eluse == true) {
			var tmpQuery = "SELECT ST_AsTIFF(ma2) as tiffvals FROM (SELECT ST_MapAlgebra(elUnion, ma1, '(CASE WHEN [rast1] >= " + el + " and [rast2] = 101 THEN 101 ELSE 100 END::int)') as ma2 FROM (SELECT ST_Union(elClip) as elUnion FROM (SELECT ST_Clip(a.rast, b.geom) as elClip FROM ned_10_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo6) as foo7, (SELECT ST_MapAlgebra(sgUnion, ccUnion, '(CASE WHEN [rast1] >= " + solgainval + " and [rast2] <= " + cancov + " THEN 101 ELSE 100 END::int)') as ma1 FROM (SELECT ST_Union(sgClip) as sgUnion FROM (SELECT ST_Clip(a.rast,b.geom) as sgClip FROM solar_gain_cor_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo) as foo2, (SELECT ST_Union(ccClip) as ccUnion FROM (SELECT ST_Clip(a.rast,b.geom) as ccClip FROM can_cov_01 a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo3) as foo4) as foo5) as foo8;";
			}
		else if (impsuruse == true) {
			var tmpQuery = "SELECT ST_AsTIFF(ma2) as tiffvals FROM (SELECT ST_MapAlgebra(isUnion, ma1, '(CASE WHEN [rast1] <= " + impsur + " and [rast2] = 101 THEN 101 ELSE 100 END::int)') as ma2 FROM (SELECT ST_Union(isClip) as isUnion FROM (SELECT ST_Clip(a.rast, b.geom) as isClip FROM imp_sur_06_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo6) as foo7, (SELECT ST_MapAlgebra(sgUnion, ccUnion, '(CASE WHEN [rast1] >= " + solgainval + " and [rast2] <= " + cancov + " THEN 101 ELSE 100 END::int)') as ma1 FROM (SELECT ST_Union(sgClip) as sgUnion FROM (SELECT ST_Clip(a.rast,b.geom) as sgClip FROM solar_gain_cor_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo) as foo2, (SELECT ST_Union(ccClip) as ccUnion FROM (SELECT ST_Clip(a.rast,b.geom) as ccClip FROM can_cov_01 a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo3) as foo4) as foo5) as foo8;";
			}
		else {
			var tmpQuery = "SELECT ST_AsTIFF(ma1) as tiffvals FROM (SELECT ST_MapAlgebra(sgUnion, ccUnion, '(CASE WHEN [rast1] >= " + solgainval + " and [rast2] <= " + cancov + " THEN 101 ELSE 100 END::int)') as ma1 FROM (SELECT ST_Union(sgClip) as sgUnion FROM (SELECT ST_Clip(a.rast,b.geom) as sgClip FROM solar_gain_cor_resampled a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo) as foo2, (SELECT ST_Union(ccClip) as ccUnion FROM (SELECT ST_Clip(a.rast,b.geom) as ccClip FROM can_cov_01 a, " + layer + " b WHERE" + tmpOid + tmpRid + ") as foo3) as foo4) as foo5;";
			}
		console.log(tmpQuery);

		var client = new pg.Client(conString);
		client.connect(function(err) {
			if(err) {
				console.error('could not connect to postgres', err);
				socket.emit('error', {'error': err});
				}
			client.query(tmpQuery, function(err, result) {
				if(err) {
					console.error('error running query', err);
					socket.emit('error', {'error': err});
					}

				var tmpData = result.rows;
				client.end();
			
				for (var i=0; i<tmpData.length; i++) {
					fs.writeFile("/var/lib/opengeo/geoserver/rpccr/" + file_name, tmpData[i].tiffvals);
					}

				console.log(Date() + " Successfully performed map algebra and output resulting raster to GeoTIFF file");
				socket.emit('map_algebra', {'status': 'Successfully output GeoTIFF file'});
				});
			});
		});

	socket.on('add_ws', function (input) {
		console.log("");
		console.log(Date() + " Verifying that the workspace 'rpccr' exists in Geoserver");
		var ws_name = input.ws;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: '/geoserver/rest/workspaces/' + ws_name,
			method: 'GET',
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			if (gsRes.statusCode == 200) {
				console.log('200 Workspace ' + ws_name + ' already exists');
				socket.emit('add_ws', {'status': 'Workspace ' + ws_name + ' already exists', 'code': '200'});
				}
			else if (gsRes.statusCode == 404) {
				data = '<workspace><name>' + ws_name + '</name></workspace>';
				var wsOptions = {
					hostname: 'felek.cns.umass.edu',
					port: '8080',
					path: '/geoserver/rest/workspaces/',
					method: 'POST',
					auth: 'admin:geoserver',
					headers: {'Content-Type':'text/xml',
						'Content-Length': Buffer.byteLength(data)}
					}
				var wsReq = http.request(wsOptions, function(wsRes){
					if (wsRes.statusCode == 201) {
						console.log('201 Workspace ' + ws_name + ' created');
						socket.emit('add_ws', {'status': 'Workspace ' + ws_name + ' created', 'code': '201'});
						}
					else {
						console.log(wsRes.statusCode + ' Error creating workspace ' + ws_name);
						socket.emit('error', {'error': 'Error creating workspace ' + ws_name, 'code': wsRes.statusCode});
						}
					});
				wsReq.write(data);
				wsReq.end();
	
				wsReq.on('error', function(e) {
					console.log('problem with request: ' + e.message);
					socket.emit('error', {'error': e.message, 'code': '404'});
					});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message});
			});
		});

	socket.on('add_cs', function (input) {
		var ws_name = input.ws;
		var cs_name = input.cs;
		var file_loc = input.file;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: '/geoserver/rest/workspaces/' + ws_name + "/coveragestores/" + cs_name,
			method: 'GET',
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			if (gsRes.statusCode == 200) {
				console.log('200 Coverage store ' + cs_name + ' already exists');
				socket.emit('add_cs', {'status': 'Coverage store ' + cs_name + ' already exists', 'code': '200'});
				}
			else if (gsRes.statusCode == 404) {
				data =  '<coverageStore>' +
					'<name>' + cs_name + '</name>' +
					'<description>rpccr layer</description>' +
					'<type>GeoTIFF</type>' +
					'<enabled>true</enabled>' +
					'<workspace><name>' + ws_name + '</name></workspace>' +
					'<__default>false</__default>' +
					'<url>file:' + file_loc + '</url>' +
					'</coverageStore>';
				var csOptions = {
					hostname: 'felek.cns.umass.edu',
					port: '8080',
					path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/',
					method: 'POST',
					auth: 'admin:geoserver',
					headers: {'Content-Type':'text/xml',
						'Content-Length': Buffer.byteLength(data)}
					}
				var csReq = http.request(csOptions, function(csRes){
					if (csRes.statusCode == 201) {
						console.log('201 Coverage store ' + cs_name + ' created');
						socket.emit('add_cs', {'status': 'Coverage store ' + cs_name + ' created', 'code': '201'});
						}
					else {
						console.log(csRes.statusCode + ' Error creating coverage store ' + cs_name);
						socket.emit('error', {'error': 'Error creating coverage store ' + cs_name, 'code': '404'});
						}
					});
				csReq.write(data);
				csReq.end();
	
				csReq.on('error', function(e) {
					console.log('problem with request: ' + e.message);
					socket.emit('error', {'error': e.message, 'code': '404'});
					});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message, 'code': '404'});
			});
		});

	socket.on('add_coverage', function (input) {
		var ws_name = input.ws;
		var cs_name = input.cs;
		var cov_name = input.cs;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: '/geoserver/rest/workspaces/' + ws_name + "/coveragestores/" + cs_name + '/coverages/' + cov_name,
			method: 'GET',
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			if (gsRes.statusCode == 200) {
				console.log('200 Coverage ' + cov_name + ' already exists');
				socket.emit('add_coverage', {'status': 'Coverage ' + cov_name + ' already exists', 'code': '200'});
				}
			else if (gsRes.statusCode == 404) {
				data =  '<coverage><name>' + cov_name + '</name></coverage>'
				var covOptions = {
					hostname: 'felek.cns.umass.edu',
					port: '8080',
					path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name + '/coverages/',
					method: 'POST',
					auth: 'admin:geoserver',
					headers: {'Content-Type':'text/xml',
						'Content-Length': Buffer.byteLength(data)}
					}
				var covReq = http.request(covOptions, function(covRes){
					if (covRes.statusCode == 201) {
						console.log('201 Coverage ' + cov_name + ' created');
						socket.emit('add_coverage', {'status': 'Coverage ' + cov_name + ' created', 'code': '201'});
						}
					else {
						console.log(covRes.statusCode + ' Error creating coverage ' + cov_name);
						socket.emit('error', {'error': 'Error creating coverage ' + cov_name, 'code': '404'});
						}
					});
				covReq.write(data);
				covReq.end();
	
				covReq.on('error', function(e) {
					console.log('problem with request: ' + e.message);
					socket.emit('error', {'error': e.message, 'code': '404'});
					});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message, 'code': '404'});
			});
		});

	socket.on('add_style', function (input) {
		var style_name = input.style;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: '/geoserver/rest/styles/' + style_name,
			method: 'GET',
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			if (gsRes.statusCode == 200) {
				console.log('200 Style ' + style_name + ' already exists');
				socket.emit('add_style', {'status': 'Style ' + style_name + ' already exists', 'code': '200'});
				}
			else if (gsRes.statusCode == 404) {
				data =  '<style><name>' + style_name + '</name><filename>EBTJV_RPCCR.sld</filename></style>'
				var styleOptions = {
					hostname: 'felek.cns.umass.edu',
					port: '8080',
					path: '/geoserver/rest/styles/',
					method: 'POST',
					auth: 'admin:geoserver',
					headers: {'Content-Type':'text/xml',
						'Content-Length': Buffer.byteLength(data)}
					}
				var styleReq = http.request(styleOptions, function(styleRes){
					if (styleRes.statusCode == 201) {
						console.log('201 Style ' + style_name + ' created');
						socket.emit('add_style', {'status': 'Style ' + style_name + ' created', 'code': '201'});
						}
					else {
						console.log(styleRes.statusCode + ' Error creating style ' + style_name);
						socket.emit('error', {'error': 'Error creating style ' + style_name, 'code': '404'});
						}
					});
				styleReq.write(data);
				styleReq.end();
	
				styleReq.on('error', function(e) {
					console.log('problem with request: ' + e.message);
					socket.emit('error', {'error': e.message, 'code': '404'});
					});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message, 'code': '404'});
			});
		});

	socket.on('change_style', function (input) {
		var layer_name = input.cs;
		var style_name = input.style;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: '/geoserver/rest/layers/' + layer_name,
			method: 'GET',
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			if (gsRes.statusCode == 200) {
				data =  '<layer><defaultStyle><name>' + style_name + '</name></defaultStyle><enabled>true</enabled></layer>'
				var styleOptions = {
					hostname: 'felek.cns.umass.edu',
					port: '8080',
					path: '/geoserver/rest/layers/' + layer_name,
					method: 'PUT',
					auth: 'admin:geoserver',
					headers: {'Content-Type':'text/xml',
						'Content-Length': Buffer.byteLength(data)}
					}
				var styleReq = http.request(styleOptions, function(styleRes){
					if (styleRes.statusCode == 200) {
						console.log('200 Style changed to ' + style_name);
						socket.emit('change_style', {'status': 'Style changed to ' + style_name, 'code': '200'});
						}
					else {
						console.log(styleRes.statusCode + ' Error changing style to ' + style_name);
						socket.emit('error', {'error': 'Error changing style to ' + style_name, 'code': styleRes.statusCode});
						}
					});
				styleReq.write(data);
				styleReq.end();
	
				styleReq.on('error', function(e) {
					console.log('problem with request: ' + e.message);
					socket.emit('error', {'error': e.message, 'code': '404'});
					});
				}
			else {
				console.log(gsRes.statusCode + ' Error getting layer ' + layer_name + ' when attempting to change style to ' + style_name);
				socket.emit('error', {'error': 'Error getting layer ' + layer_name + ' when attempting to change style to ' + style_name, 'code': gsRes.statusCode});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message, 'code': '404'});
			});
		});

	socket.on('zoom_layer', function(input) {
		var cs_name = input.cs;
		var url = input.url;

		var http = require('http');
		var options = {
  			hostname: 'felek.cns.umass.edu',
			port: '8080',
			path: url,
			method: 'GET',
			headers: {'Content-Type':'application/json'},
			auth: 'admin:geoserver'
			}
		var gsReq = http.request(options, function(gsRes){
			var data = "";
			if (gsRes.statusCode == 200) {
				gsRes.on('data', function(chunk) {
					data += chunk;
					});
				gsRes.on('end', function() {
					console.log('200 Retrieved coverage or feature type data for ' + cs_name);
					socket.emit('zoom_layer', {'data': data});
					});
				}
			else if (gsRes.statusCode == 404) {
				console.log('404 Coverage or feature type ' + cs_name + ' does not exist');
				socket.emit('error', {'error': 'Coverage or feature type ' + cs_name + ' does not exist', 'code': '404'});
				}
			else {
				console.log(gsRes.statusCode + ' Error retrieving data from coverage or feature type ' + cs_name);
				socket.emit('error', {'error': 'Error retrieving data from coverage or feature type ' + cs_name, 'code': gsRes.statusCode});
				}
			});

		gsReq.end();

		gsReq.on('error', function(e) {
  			console.log('problem with request: ' + e.message);
			socket.emit('error', {'error': e.message, 'code': '404'});
			});
		});

	socket.on('delete_rpccr_data', function(input) {
		delete_layer(input);
		/*delete_coverage(input);
		delete_cs(input);
		delete_geotiff(input);*/
		});

	socket.on('disconnect', function () {
    		socket.emit('disconnect');
 		 });
	});

function delete_layer(input) {
	var layer_name = input.cs;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: '/geoserver/rest/layers/' + layer_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Layer ' + layer_name + ' deleted');
			delete_coverage(input);
			//socket.emit('delete_layer', {'status': 'Layer ' + layer_name + ' deleted', 'code': '200'});
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting layer ' + layer_name);
			//socket.emit('error', {'error': 'Error deleting layer ' + layer_name, 'code': '404'});
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		//socket.emit('error', {'error': e.message, 'code': '404'});
		});
	}

function delete_coverage(input) {
	var ws_name = input.ws;
	var cs_name = input.cs;
	var cov_name = input.cs;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name + '/coverages/' + cov_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage ' + cov_name + ' deleted');
			delete_cs(input);
			//socket.emit('delete_coverage', {'status': 'Coverage ' + cov_name + ' deleted', 'code': '200'});
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting coverage ' + cov_name);
			//socket.emit('error', {'error': 'Error deleting coverage ' + cov_name, 'code': '404'});
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		//socket.emit('error', {'error': e.message, 'code': '404'});
		});
	}

function delete_cs(input) {
	var ws_name = input.ws;
	var cs_name = input.cs;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage store ' + cs_name + ' deleted');
			delete_geotiff(input);
			//socket.emit('delete_cs', {'status': 'Coverage store ' + cs_name + ' deleted', 'code': '200'});
			}
		else if (gsRes.statusCode == 403) {
			console.log('403 Coverage store ' + cs_name + ' is not empty');
			//socket.emit('error', {'error': 'Coverage store ' + cs_name + ' is not empty', 'code': '403'});
			}
		else {
			console.log(gsRes.statusCode + 'Error deleting coverage store ' + cs_name);
			//socket.emit('error', {'error': 'Error deleting coverage store ' + cs_name, 'code': '404'});
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		//socket.emit('error', {'error': e.message, 'code': '404'});
		});
	}

function delete_geotiff(input) {
	var file_name = input.file_name;
	console.log(file_name);

	var fs = require('fs');

	fs.unlinkSync("/var/lib/opengeo/geoserver/rpccr/" + file_name);

	console.log('200 GeoTIFF file ' + file_name + ' deleted');
	//socket.emit('delete_geotiff', {'status': 'GeoTIFF file ' + file_name + ' deleted', 'code': '200'});
	}

app.get('/', function(req, res) {
	res.header('Access-Control-Allow-Origin', "*");
	res.statusCode = 200;
	return res.send("Listening for RPCCR requests.");
	});


app.post('/add_style', function(req, res) {
	var style_name = req.body.style;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: '/geoserver/rest/styles/' + style_name,
		method: 'GET',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Style ' + style_name + ' already exists');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Style ' + style_name + ' already exists');
			}
		else if (gsRes.statusCode == 404) {
			data =  '<style><name>' + style_name + '</name><filename>EBTJV_RPCCR.sld</filename></style>'
			var styleOptions = {
				hostname: 'felek.cns.umass.edu',
				port: '8080',
				path: '/geoserver/rest/styles/',
				method: 'POST',
				auth: 'admin:geoserver',
				headers: {'Content-Type':'text/xml',
					'Content-Length': Buffer.byteLength(data)}
				}
			var styleReq = http.request(styleOptions, function(styleRes){
				if (styleRes.statusCode == 201) {
					console.log('201 Style ' + style_name + ' created');
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 201;
					return res.send('Style ' + style_name + ' created');
					}
				else {
					console.log(styleRes.statusCode + ' Error creating style ' + style_name);
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 404;
					return res.send('Error');
					}
				});
			styleReq.write(data);
			styleReq.end();
	
			styleReq.on('error', function(e) {
				console.log('problem with request: ' + e.message);
				res.header('Access-Control-Allow-Origin', "*");
				res.statusCode = 404;
				return res.send(e.message);
				});
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		res.header('Access-Control-Allow-Origin', "*");
		res.statusCode = 404;
		return res.send(e.message);
		});
	});

app.post('/delete_style', function(req, res) {
	var style_name = req.body.style;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: '/geoserver/rest/styles/' + style_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Style ' + style_name + ' deleted');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Style ' + style_name + ' deleted');
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting style ' + style_name);
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = gsRes.statusCode;
			return res.send('Error');
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		res.header('Access-Control-Allow-Origin', "*");
		res.statusCode = 404;
		return res.send(e.message);
		});
	});



app.post('/zoom_layer', function(req, res) {
	var cs_name = req.body.cs;
	var url = req.body.url;

	var http = require('http');
	var options = {
  		hostname: 'felek.cns.umass.edu',
		port: '8080',
		path: url,
		method: 'GET',
		headers: {'Content-Type':'application/json'},
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		var data = "";
		if (gsRes.statusCode == 200) {
			gsRes.on('data', function(chunk) {
				data += chunk;
				});
			gsRes.on('end', function() {
				console.log('200 Retrieved coverage or feature type data for ' + cs_name);
				res.header('Access-Control-Allow-Origin', "*");
				res.statusCode = 200;
				return res.send(data);
				});
			}
		else if (gsRes.statusCode == 404) {
			console.log('404 Coverage or feature type ' + cs_name + ' does not exist');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 404;
			return res.send(data);
			}
		else {
			console.log(gsRes.statusCode + ' Error retrieving data from coverage or feature type ' + cs_name);
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = gsRes.statusCode;
			return res.send('Error');
			}
		});

	gsReq.end();

	gsReq.on('error', function(e) {
  		console.log('problem with request: ' + e.message);
		res.header('Access-Control-Allow-Origin', "*");
		res.statusCode = 404;
		return res.send(e.message);
		});
	});