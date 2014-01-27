var express = require('express');
var app = express();

app.use(express.bodyParser());

app.get('/', function(req, res) {
	res.header('Access-Control-Allow-Origin', "*");
	res.statusCode = 200;
	return res.send("Listening for RPCCR requests.");
	});

app.post('/get_rid', function(req,res) {
	console.log("");
	console.log("Acquiring rid values from solar_gain_cor_resampled contained within the selected polygon feature(s)");
	var layer = req.body.layer;
	var id_field = req.body.id_field;
	var oid = req.body.oid;

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
	
	var conString = 'postgres://Jason:Jason20!@localhost:5432/Riparian';
	
	var tmpQuery = "SELECT a.rid FROM solar_gain_cor_resampled a, " + layer + " b WHERE " + tmpOid + " and ST_Intersects(a.rast, b.geom) = 't';"
	console.log(tmpQuery);

	var client = new pg.Client(conString);
	client.connect(function(err) {
		if(err) {
			console.error('could not connect to postgres', err);
			}
		client.query(tmpQuery, function(err, result) {
			if(err) {
				console.error('error running query', err);
				res.header('Access-Control-Allow-Origin', "*");
				res.statusCode = 404;
				return res.send('Error running query');
				}
			var tmpData = result.rows;
			client.end();

			console.log("Successfully acquired raster rid values: " + JSON.stringify(tmpData));
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send(tmpData);
			});
		});
	});

app.post('/solar_gain_percentile', function(req,res) {
	console.log("");
	console.log("Acquiring solar gain distribution from solar_gain_cor_resampled to determine value that corresponds with user-specified percentile");
	var layer = req.body.layer;
	var id_field = req.body.id_field;
	var oid = req.body.oid;
	var rid = req.body.rid;
	var solgain = req.body.solgain;

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

	var conString = 'postgres://Jason:Jason20!@localhost:5432/Riparian';
	
	var tmpQuery = "SELECT (tmpvals).value, sum((tmpVals).count) as count FROM (SELECT ST_ValueCount(ST_Clip(a.rast,b.geom), 1, true) As tmpVals FROM solar_gain_cor_resampled a, " + layer + " b WHERE " + tmpOid + tmpRid + ") as foo GROUP BY (tmpvals).value ORDER BY (tmpvals).value;"
	console.log(tmpQuery);

	var client = new pg.Client(conString);
	client.connect(function(err) {
		if(err) {
			console.error('could not connect to postgres', err);
			}
		client.query(tmpQuery, function(err, result) {
			if(err) {
				console.error('error running query', err);
				res.header('Access-Control-Allow-Origin', "*");
				res.statusCode = 404;
				return res.send('Error running query');
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
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send(retData);
			});
		});
	});

app.post('/map_algebra', function(req,res) {
	console.log("");
	console.log(Date() + " Performing map algebra using user-specified values");
	var layer = req.body.layer;
	var id_field = req.body.id_field;
	var oid = req.body.oid;
	var rid = req.body.rid;
	var solgain = req.body.solgain;
	var solgainval = req.body.solgainval;
	var cancov = req.body.cancov;
	var impsur = req.body.impsur;
	var impsuruse = req.body.impsuruse;
	var file_name = req.body.file_name;
	
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


	var conString = 'postgres://Jason:Jason20!@localhost:5432/Riparian';

	if (impsuruse == 'true') {
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
			}
		client.query(tmpQuery, function(err, result) {
			if(err) {
				console.error('error running query', err);
				res.header('Access-Control-Allow-Origin', "*");
				res.statusCode = 404;
				return res.send('Error running query');
				}

			var tmpData = result.rows;
			client.end();
			
			for (var i=0; i<tmpData.length; i++) {
				fs.writeFile("C:/Program Files/GeoServer 2.3.3/data_dir/rpccr/" + file_name, tmpData[i].tiffvals);
				}

			console.log(Date() + " Successfully performed map algebra and output resulting raster to GeoTIFF file");
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send("Successfully Output File");
			});
		});
	});

app.post('/delete_geotiff', function(req, res) {
	var file_name = req.body.file_name;
	console.log(file_name);

	var fs = require('fs');

	fs.unlinkSync("C:/Program Files/GeoServer 2.3.3/data_dir/rpccr/" + file_name);

	console.log('200 GeoTIFF file ' + file_name + ' deleted');
	res.header('Access-Control-Allow-Origin', "*");
	res.statusCode = 200;
	return res.send('GeoTiff file ' + file_name + ' deleted');
	});

app.post('/add_ws', function(req, res) {
	var ws_name = req.body.ws;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name,
		method: 'GET',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Workspace ' + ws_name + ' already exists');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Workspace ' + ws_name + ' already exists');
			}
		else if (gsRes.statusCode == 404) {
			data = '<workspace><name>' + ws_name + '</name></workspace>';
			var wsOptions = {
				hostname: 'localhost',
				port: '8090',
				path: '/geoserver/rest/workspaces/',
				method: 'POST',
				auth: 'admin:geoserver',
				headers: {'Content-Type':'text/xml',
					'Content-Length': Buffer.byteLength(data)}
				}
			var wsReq = http.request(wsOptions, function(wsRes){
				if (wsRes.statusCode == 201) {
					console.log('201 Workspace ' + ws_name + ' created');
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 201;
					return res.send('Workspace ' + ws_name + ' created');
					}
				else {
					console.log(wsRes.statusCode + ' Error creating workspace ' + ws_name);
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 404;
					return res.send('Error');
					}
				});
			wsReq.write(data);
			wsReq.end();
	
			wsReq.on('error', function(e) {
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

app.post('/delete_ws', function(req, res) {
	var ws_name = req.body.ws;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Workspace ' + ws_name + ' deleted');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Workspace ' + ws_name + ' deleted');
			}
		else if (gsRes.statusCode == 403) {
			console.log('403 Workspace ' + ws_name + ' is not empty');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 403;
			return res.send('Workspace ' + ws_name + ' is not empty');
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting workspace ' + ws_name);
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

app.post('/add_cs', function(req, res) {
	var ws_name = req.body.ws;
	var cs_name = req.body.cs;
	var file_loc = req.body.file;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name + "/coveragestores/" + cs_name,
		method: 'GET',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage store ' + cs_name + ' already exists');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Coverage store ' + cs_name + ' already exists');
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
				hostname: 'localhost',
				port: '8090',
				path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/',
				method: 'POST',
				auth: 'admin:geoserver',
				headers: {'Content-Type':'text/xml',
					'Content-Length': Buffer.byteLength(data)}
				}
			var csReq = http.request(csOptions, function(csRes){
				if (csRes.statusCode == 201) {
					console.log('201 Coverage store ' + cs_name + ' created');
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 201;
					return res.send('Coverage store ' + cs_name + ' created');
					}
				else {
					console.log(csRes.statusCode + ' Error creating coverage store ' + cs_name);
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 404;
					return res.send('Error');
					}
				});
			csReq.write(data);
			csReq.end();
	
			csReq.on('error', function(e) {
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

app.post('/delete_cs', function(req, res) {
	var ws_name = req.body.ws;
	var cs_name = req.body.cs;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage store ' + cs_name + ' deleted');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Coverage store ' + cs_name + ' deleted');
			}
		else if (gsRes.statusCode == 403) {
			console.log('403 Coverage store ' + cs_name + ' is not empty');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 403;
			return res.send('Coverage store ' + cs_name + ' is not empty');
			}
		else {
			console.log(gsRes.statusCode + 'Error deleting coverage store ' + cs_name);
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

app.post('/add_coverage', function(req, res) {
	var ws_name = req.body.ws;
	var cs_name = req.body.cs;
	var cov_name = req.body.cs;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name + "/coveragestores/" + cs_name + '/coverages/' + cov_name,
		method: 'GET',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage ' + cov_name + ' already exists');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Coverage ' + cov_name + ' already exists');
			}
		else if (gsRes.statusCode == 404) {
			data =  '<coverage><name>' + cov_name + '</name></coverage>'
			var covOptions = {
				hostname: 'localhost',
				port: '8090',
				path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name + '/coverages/',
				method: 'POST',
				auth: 'admin:geoserver',
				headers: {'Content-Type':'text/xml',
					'Content-Length': Buffer.byteLength(data)}
				}
			var covReq = http.request(covOptions, function(covRes){
				if (covRes.statusCode == 201) {
					console.log('201 Coverage ' + cov_name + ' created');
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 201;
					return res.send('Coverage ' + cov_name + ' created');
					}
				else {
					console.log(covRes.statusCode + ' Error creating coverage ' + cov_name);
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 404;
					return res.send('Error');
					}
				});
			covReq.write(data);
			covReq.end();
	
			covReq.on('error', function(e) {
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

app.post('/delete_layer', function(req, res) {
	var layer_name = req.body.cs;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/layers/' + layer_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Layer ' + layer_name + ' deleted');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Layer ' + layer_name + ' deleted');
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting layer ' + layer_name);
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
	
app.post('/delete_coverage', function(req, res) {
	var ws_name = req.body.ws;
	var cs_name = req.body.cs;
	var cov_name = req.body.cs;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/workspaces/' + ws_name + '/coveragestores/' + cs_name + '/coverages/' + cov_name,
		method: 'DELETE',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			console.log('200 Coverage ' + cov_name + ' deleted');
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 200;
			return res.send('Coverage ' + cov_name + ' deleted');
			}
		else {
			console.log(gsRes.statusCode + ' Error deleting coverage ' + cov_name);
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

app.post('/add_style', function(req, res) {
	var style_name = req.body.style;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
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
				hostname: 'localhost',
				port: '8090',
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
  		hostname: 'localhost',
		port: '8090',
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

app.post('/change_style', function(req, res) {
	var layer_name = req.body.cs;
	var style_name = req.body.style;

	var http = require('http');
	var options = {
  		hostname: 'localhost',
		port: '8090',
		path: '/geoserver/rest/layers/' + layer_name,
		method: 'GET',
		auth: 'admin:geoserver'
		}
	var gsReq = http.request(options, function(gsRes){
		if (gsRes.statusCode == 200) {
			data =  '<layer><defaultStyle><name>' + style_name + '</name></defaultStyle><enabled>true</enabled></layer>'
			var styleOptions = {
				hostname: 'localhost',
				port: '8090',
				path: '/geoserver/rest/layers/' + layer_name,
				method: 'PUT',
				auth: 'admin:geoserver',
				headers: {'Content-Type':'text/xml',
					'Content-Length': Buffer.byteLength(data)}
				}
			var styleReq = http.request(styleOptions, function(styleRes){
				if (styleRes.statusCode == 200) {
					console.log('200 Style changed to ' + style_name);
					res.header('Access-Control-Allow-Origin', "*");
					res.statusCode = 200;
					return res.send('Style changed to ' + style_name);
					}
				else {
					console.log(styleRes.statusCode + ' Error changing style to ' + style_name);
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
		else {
			console.log(gsRes.statusCode + ' Error getting layer ' + layer_name + ' when attempting to change style to ' + style_name);
			res.header('Access-Control-Allow-Origin', "*");
			res.statusCode = 404;
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
  		hostname: 'localhost',
		port: '8090',
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

app.listen(process.env.PORT || 3412);