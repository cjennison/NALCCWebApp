function getRiparian() {
	document.getElementById("download").style.visibility = "hidden";
	document.getElementById("idLayerList").style.visibility = "hidden";
	document.getElementById("selLayerList").style.visibility = "hidden";
	document.getElementById("coords").style.visibility = "hidden";

	ripDiv = document.getElementById("riparian");
	if (ripDiv.style.visibility == "visible") {
		ripDiv.style.visibility = "hidden";
		return;
		}
	if (ripDiv.childNodes.length == 0) {
		ripDiv.style.padding = "0px";
		tmpExit = document.createElement("img");
		tmpExit.src = "Images/exit2_small.png";
		tmpExit.setAttribute("onclick", "document.getElementById('riparian').style.visibility = 'hidden'");
		tmpExit.id = "ripExit";
		tmpExit.setAttribute("onmouseover", "selCursor(this.id)");
		tmpExit.style.cssFloat = "right";
		tmpExit.style.margin = "2px";
		ripDiv.appendChild(tmpExit);

		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripDiv.appendChild(breakP);

		ripHeading = document.createElement("p");
		ripHeading.innerHTML = "Input Specifications";
		ripHeading.style.textAlign = "center";
		ripHeading.style.margin = "0px";
		ripDiv.appendChild(ripHeading);
		ripBar = document.createElement("hr");
		ripDiv.appendChild(ripBar);

		ripForm = document.createElement("form");
		ripForm.id = "ripForm";

		canCheck = document.createElement("input");
		canCheck.setAttribute("type", "checkbox");
		canCheck.id = "canCheck";
		canCheck.style.margin = "5px";
		canCheck.style.visibility = "hidden";
		ripForm.appendChild(canCheck);
		canCheck.checked = true;
		canLab = document.createElement("label");
		canLab.innerHTML = "% Canopy Cover <=";
		canLab.style.margin = "5px";
		canLab.style.marginRight = "49px";
		ripForm.appendChild(canLab);
		canInp = document.createElement("input");
		canInp.setAttribute("type", "text");
		canInp.id = "canInp";
		canInp.name = "canInp";
		canInp.value = "70";
		canInp.style.margin = "5px";
		canInp.style.width = "70px";
		ripForm.appendChild(canInp);
		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripForm.appendChild(breakP);

		solGainCheck = document.createElement("input");
		solGainCheck.setAttribute("type", "checkbox");
		solGainCheck.id = "solGainCheck";
		solGainCheck.style.margin = "5px";
		solGainCheck.style.visibility = "hidden";
		ripForm.appendChild(solGainCheck);
		solGainCheck.checked = true;
		solGainLab = document.createElement("label");
		solGainLab.innerHTML = "Solar Gain Percentile >=";
		solGainLab.style.margin = "5px";
		solGainLab.style.marginRight = "15px";
		ripForm.appendChild(solGainLab);
		solGainInp = document.createElement("input");
		solGainInp.setAttribute("type", "text");
		solGainInp.id = "solGainInp";
		solGainInp.name = "solGainInp";
		solGainInp.value = "75";
		solGainInp.style.margin = "5px";
		solGainInp.style.width = "70px";
		ripForm.appendChild(solGainInp);
		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripForm.appendChild(breakP);

		elCheck = document.createElement("input");
		elCheck.setAttribute("type", "checkbox");
		elCheck.id = "elCheck";
		elCheck.style.margin = "5px";
		ripForm.appendChild(elCheck);
		elCheck.checked = true;
		elLab = document.createElement("label");
		elLab.innerHTML = "Elevation (m) >=";
		elLab.style.margin = "5px";
		elLab.style.marginRight = "69px";
		ripForm.appendChild(elLab);
		elInp = document.createElement("input");
		elInp.setAttribute("type", "text");
		elInp.id = "elInp";
		elInp.name = "elInp";
		elInp.value = "600";
		elInp.style.margin = "5px";
		elInp.style.width = "70px";
		ripForm.appendChild(elInp);
		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripForm.appendChild(breakP);

		impSurCheck = document.createElement("input");
		impSurCheck.setAttribute("type", "checkbox");
		impSurCheck.id = "impSurCheck";
		impSurCheck.style.margin = "5px";
		ripForm.appendChild(impSurCheck);
		impSurCheck.checked = true;
		impSurLab = document.createElement("label");
		impSurLab.innerHTML = "% Impervious Surface <=";
		impSurLab.style.margin = "5px";
		impSurLab.style.marginRight = "15px";
		ripForm.appendChild(impSurLab);
		impSurInp = document.createElement("input");
		impSurInp.setAttribute("type", "text");
		impSurInp.id = "impSurInp";
		impSurInp.name = "impSurInp";
		impSurInp.value = "10";
		impSurInp.style.margin = "5px";
		impSurInp.style.width = "70px";
		ripForm.appendChild(impSurInp);
		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripForm.appendChild(breakP);

		conSelCheck = document.createElement("input");
		conSelCheck.setAttribute("type", "checkbox");
		conSelCheck.setAttribute("onclick", "conSelAlert(this.checked)");
		conSelCheck.id = "conSelCheck";
		conSelCheck.style.margin = "5px";
		ripForm.appendChild(conSelCheck);
		conSelCheck.checked = true;
		conSelLab = document.createElement("label");
		conSelLab.innerHTML = "Restrict Extent by Selected Features";
		conSelLab.style.margin = "5px";
		conSelLab.style.marginRight = "15px";
		ripForm.appendChild(conSelLab);
		breakP = document.createElement("p");
		breakP.innerHTML = "<br>";
		breakP.style.margin = "0px";
		ripForm.appendChild(breakP);

		ripDiv.appendChild(ripForm);

		submitInp = document.createElement("button");
		submitInp.setAttribute("onclick", "addRPCCR()");
		submitInp.setAttribute("onmouseup", "rpccr_visual(1)");
		submitInp.style.cursor = "pointer";
		submitInp.id = "submitInp";
		submitInp.innerHTML = "Get Locations";
		submitInp.style.width = "125px";
		submitInp.style.marginBottom = "10px";
		ripDiv.appendChild(submitInp);
		}
	submitInp.style.marginLeft = (ripDiv.offsetWidth - submitInp.offsetWidth)/2 + "px";
	panel = document.getElementById("controlPanel");
	x = panel.childNodes;
	xx = x[15];
	x = xx.getBoundingClientRect();
	ripDiv.style.left = x.left + "px";
	ripDiv.style.top = x.bottom + "px";
	ripDiv.style.borderRadius = "0px 10px 10px 10px";

	w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
	if (ripDiv.offsetLeft + ripDiv.offsetWidth > w) {
		ripDiv.style.left = w - ripDiv.offsetWidth + "px";
		}
	ripDiv.style.visibility = "visible";
	}

function conSelAlert(tmpCheck) {
	if (tmpCheck == false) {
		alert("Unchecking this option makes the analysis default to the 'EBTJV Boundary' layer,\nregardless of whether features are selected or not,\nwhich will be quite time consuming.");
		}
	}

function addRPCCR() {
	if (oid.length == 0 && document.getElementById("conSelCheck").checked == true) {
		alert("You have not selected any features");
		rpccr_visual(0);
		return;
		}

	if (document.getElementById("conSelCheck").checked == false) {
		clearSelFeat();
		oid.push({"oid": 0});
		rpccrSFLayer = "ebtjv_boundary";
		}
		
	tmpProgress = document.getElementById("progress");
	tmpStatus = document.getElementById("prog_state");
	steps = 9
	stepCnt = -1
	tmpProgress.innerHTML = "Initiating...";
	stepCnt += 1;
	tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";

	strOid = "";
	for (i in oid) {
		if (strOid == "") {
			strOid = oid[i].oid;
			}
		else {
			strOid += "-" + oid[i].oid;
			}
		}

	tmp_cs_id = rpccrSFLayer + "-" + strOid + "-" + document.getElementById("canInp").value + "-" + document.getElementById("solGainInp").value;
	if (document.getElementById("elCheck").checked == true) {
		tmp_cs_id +=  "-" + document.getElementById("elInp").value
		}
	if (document.getElementById("impSurCheck").checked == true) {
		tmp_cs_id +=  "-" + document.getElementById("impSurInp").value
		}
	cs_id = tmp_cs_id.replace(" ", "_");

	
	file_loc = "rpccr/" + cs_id + ".tif";
	file_name = cs_id + ".tif";
		
	for (var i=0; i<rpccr_id.length; i++) {
		if (rpccr_id[i] == cs_id) {
			alert("The RPCCR layer you are attempting to add is already present on the map.");
			rpccr_visual(0);
			return;
			}
		}

	input = {"layer": rpccrSFLayer, "id_field": uniqueID[rpccrSFNum], "oid": oid};

	tmpProgress.innerHTML = "Acquiring rid values";
	stepCnt += 1;
	tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";

	socket.emit('get_rid', input);
	}

function rpccr_socket() {
	socket = io.connect('http://felek.cns.umass.edu:3412');

	socket.on('get_rid', function(tmpData) {
		rid = [];
		for (var i=0; i<tmpData.length; i++) {
			rid.push({"rid": tmpData[i].rid});
			}
		input = {"layer": rpccrSFLayer, "id_field": uniqueID[rpccrSFNum], "oid": oid, "rid": rid, "solgain": document.getElementById("solGainInp").value};
		tmpProgress.innerHTML = "Calculating solar gain percentile value";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('solar_gain_percentile', input);
		});
	socket.on('solar_gain_percentile', function(tmpData) {
		solgainval = tmpData.value;
		input = {"layer": rpccrSFLayer, "id_field": uniqueID[rpccrSFNum], "oid": oid, "rid": rid, "solgain": document.getElementById("solGainInp").value, "solgainval": solgainval, "cancov": document.getElementById("canInp").value, "el": document.getElementById("elInp").value, "eluse": document.getElementById("elCheck").checked, "impsur": document.getElementById("impSurInp").value, "impsuruse": document.getElementById("impSurCheck").checked, "file_name": file_name};
		tmpProgress.innerHTML = "Outputting map algebra function to GeoTIFF file";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('map_algebra', input);
		});
	socket.on('map_algebra', function(tmpData) {
		rpccr_file_name.push(file_name);
		input = {"ws":"rpccr", "cs": cs_id, "file": file_loc, "style":"rpccr_style"};
		tmpProgress.innerHTML = "Verifying Workspace";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('add_ws', input);
		});
	socket.on('add_ws', function(tmpData) {
		tmpProgress.innerHTML = "Creating Coverage Store";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('add_cs', input);
		});
	socket.on('add_cs', function(tmpData) {
		tmpProgress.innerHTML = "Adding Coverage";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('add_coverage', input);
		});
	socket.on('add_coverage', function(tmpData) {
		tmpProgress.innerHTML = "Verifying Style";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('add_style', input);
		});
	socket.on('add_style', function(tmpData) {
		tmpProgress.innerHTML = "Assigning Style";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		socket.emit('change_style', input);
		});
	socket.on('change_style', function(tmpData) {
		tmpProgress.innerHTML = "Adding Layer to Map";
		stepCnt += 1;
		tmpStatus.style.width = Math.round((stepCnt/steps)*100) + "%";
		rpccr_id.push(cs_id);
		rpccr_count = rpccrLayers[rpccrLayers.length];
		rpccrLayers[rpccr_count] = new OpenLayers.Layer.WMS( cs_id,
 			"http://felek.cns.umass.edu:8080/geoserver/rpccr/wms", 
			{layers: cs_id, format: "image/png", transparent: true} 
			);
		layerVar.push(rpccrLayers[rpccr_count]);
		layerNS.push("rpccr:" + cs_id);
		layerType.push("raster");
		legSpec.push("none");
		map.addLayer(rpccrLayers[rpccr_count]);
		x = map.getNumLayers();
		map.setLayerIndex(rpccrLayers[rpccr_count],x-3);
		rpccrLayers[rpccr_count].setVisibility(true);
		createLegend();
		zoomToLayer(x-3,1);
		rpccr_visual(0);
		});
	socket.on('zoom_layer', function(data) {

		});
	socket.on('disconnect', function(err) {
		//alert('Socket has been disconnected');
		});
	socket.on('error', function(err) {
		socket.emit('disconnect');
		alert(err.error);
		rpccr_visual(0);
		});
	}

function rpccr_visual(tmpBi) {
	if (tmpBi == 0) {
		document.getElementById("rpccr_background").style.visibility = "hidden";
		document.getElementById("rpccr_status").style.visibility = "hidden";
		}
	else {
		tmpDiv = document.getElementById("rpccr_status");
		if (tmpDiv.childNodes.length == 0) {
			rpccr_title = document.createElement("h1");
			rpccr_title.innerHTML = "Request Status";
			rpccr_title.style.textAlign = "center";
			tmpDiv.appendChild(rpccr_title);
			progress = document.createElement("p");
			progress.id = "progress";
			progress.style.textAlign = "center";
			tmpDiv.appendChild(progress);
			prog_cont = document.createElement("div");
			prog_cont.style.width = "100%";
			prog_cont.style.height = "20px";
			prog_cont.style.borderTop = "solid";
			prog_cont.style.borderBottom = "solid";
			prog_cont.style.borderWidthTop = "2px";
			prog_cont.style.borderWidthBottom = "2px";
			prog_cont.style.borderColor = "#FFFFFF";
			prog_cont.style.backgroundColor = "#000000";
			prog_cont.style.opacity = 1;
			prog_state = document.createElement("div");
			prog_state.id = "prog_state";
			prog_state.style.height = "100%";
			prog_state.style.width = "0%";
			prog_state.style.backgroundColor = "#00FF00";
			prog_state.style.opacity = 1;
			prog_cont.appendChild(prog_state);
			tmpDiv.appendChild(prog_cont);
			}
		w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
		h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
		tmpDiv.style.top = (h - tmpDiv.offsetHeight)/2 + "px";
		tmpDiv.style.left = (w - tmpDiv.offsetWidth)/2 + "px";
		progress.innerHTML = "Initiating...";
		document.getElementById("riparian").style.visibility = "hidden";
		document.getElementById("rpccr_background").style.visibility = "visible";
		document.getElementById("rpccr_status").style.visibility = "visible";
		}
	}
