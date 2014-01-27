function setStyleParams(layerName){
	var sld = '<?xml version="1.0" encoding="ISO-8859-1"?>';
	sld += '<StyledLayerDescriptor version="1.0.0"'; 
	sld += '    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" ';
	sld += '    xmlns="http://www.opengis.net/sld" ';
	sld += '    xmlns:ogc="http://www.opengis.net/ogc" ';
	sld += '    xmlns:xlink="http://www.w3.org/1999/xlink" ';
	sld += '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">';
	sld += '  <NamedLayer>';
	sld += '    <Name>' + layerName + '</Name>';
	sld += '    <UserStyle>';
	sld += '      <Title>SLD Cook Book: Attribute-based polygon</Title>';
	sld += '      <FeatureTypeStyle>';
	sld += '        <Rule>';
	sld += '          <Name>SmallArea</Name>';
	sld += '          <Title>Less Than 10</Title>';
	sld += '          <ogc:Filter>';
	sld += '            <ogc:PropertyIsLessThan>';
	sld += '              <ogc:PropertyName>AreaSqKM</ogc:PropertyName>';
	sld += '              <ogc:Literal>10.00</ogc:Literal>';
	sld += '            </ogc:PropertyIsLessThan>';
	sld += '          </ogc:Filter>';
	sld += '          <PolygonSymbolizer>';
	sld += '            <Fill>';
	sld += '              <CssParameter name="fill">#99FF99</CssParameter>';
	sld += '            </Fill>';
	sld += '             <Stroke>';
    sld += '       			<CssParameter name="stroke">#FFFFFF</CssParameter>';
    sld += '       			<CssParameter name="stroke-width">.2</CssParameter>';
    sld += '    		 </Stroke>';
	sld += '          </PolygonSymbolizer>';
	sld += '        </Rule>';
	sld += '        <Rule>';
	sld += '          <Name>MediumPop</Name>';
	sld += '          <Title>200,000 to 500,000</Title>';
	sld += '          <ogc:Filter>';
	sld += '            <ogc:And>';
	sld += '              <ogc:PropertyIsGreaterThanOrEqualTo>';
	sld += '                <ogc:PropertyName>AreaSqKM</ogc:PropertyName>';
	sld += '                <ogc:Literal>10.00</ogc:Literal>';
	sld += '              </ogc:PropertyIsGreaterThanOrEqualTo>';
	sld += '              <ogc:PropertyIsLessThan>';
	sld += '                <ogc:PropertyName>AreaSqKM</ogc:PropertyName>';
	sld += '                <ogc:Literal>40.00</ogc:Literal>';
	sld += '              </ogc:PropertyIsLessThan>';
	sld += '            </ogc:And>';
	sld += '          </ogc:Filter>';
	sld += '          <PolygonSymbolizer>';
	sld += '            <Fill>';
	sld += '              <CssParameter name="fill">#33CC33</CssParameter>';
	sld += '            </Fill>';
	sld += '             <Stroke>';
    sld += '       			<CssParameter name="stroke">#FFFFFF</CssParameter>';
    sld += '       			<CssParameter name="stroke-width">.2</CssParameter>';
    sld += '    		 </Stroke>';
	sld += '          </PolygonSymbolizer>';
	sld += '        </Rule>';
	sld += '        <Rule>';
	sld += '          <Name>LargePop</Name>';
	sld += '          <Title>Greater Than 500,000</Title>';
	sld += '          <ogc:Filter>';
	sld += '            <ogc:PropertyIsGreaterThan>';
	sld += '              <ogc:PropertyName>AreaSqKM</ogc:PropertyName>';
	sld += '              <ogc:Literal>40.00</ogc:Literal>';
	sld += '            </ogc:PropertyIsGreaterThan>';
	sld += '          </ogc:Filter>';
	sld += '          <PolygonSymbolizer>';
	sld += '            <Fill>';
	sld += '              <CssParameter name="fill">#009900</CssParameter>';
	sld += '            </Fill>';
	sld += '             <Stroke>';
    sld += '       			<CssParameter name="stroke">#FFFFFF</CssParameter>';
    sld += '       			<CssParameter name="stroke-width">.2</CssParameter>';
    sld += '    		 </Stroke>';
	sld += '          </PolygonSymbolizer>';
	sld += '        </Rule>';
	sld += '      </FeatureTypeStyle>';
	sld += '    </UserStyle>';
	sld += '  </NamedLayer>';
	sld += '</StyledLayerDescriptor>';
	
	
	return sld;
}


function setStyleWithRules(key, layerName){
	var rule = rule_data[key];
	console.log(rule);
	var property = rule_data[key].property_name;
	var rules = rule.rules;
	
	$(".legend ul").remove();
	
	var legend = $(".legend");
	var ul = $("<ul></ul>");
	
	$(".l-label").html(rule_data[key].property_label);
	$(".l-sublabel").html(rule_data[key].property_sublabel);
	
	
	
	
	var sld = '<?xml version="1.0" encoding="ISO-8859-1"?>';
	sld += '<StyledLayerDescriptor version="1.0.0"'; 
	sld += '    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" ';
	sld += '    xmlns="http://www.opengis.net/sld" ';
	sld += '    xmlns:ogc="http://www.opengis.net/ogc" ';
	sld += '    xmlns:xlink="http://www.w3.org/1999/xlink" ';
	sld += '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">';
	sld += '  <NamedLayer>';
	sld += '    <Name>' + layerName + '</Name>';
	sld += '    <UserStyle>';
	sld += '      <Title>SLD Cook Book: Attribute-based polygon</Title>';
	sld += '      <FeatureTypeStyle>';
	
	//Add rules here
	//Close Up Values Here
	for(var i = 0; i < rules.length; i++){
		
		var li = $("<li></li>");
		
		$(li).html("<div class='sample-color' style='background-color:" + rules[i].fill + "'></div>" + rules[i].label);
		
		sld += '<Rule>';
		//sld += '          <Name>' + rules[i].label + '</Name>';
		//sld += '          <Title>' + rules[i].label + '</Title>';
		
		//Start Rule
		sld += ' 		  <MaxScaleDenominator>200000</MaxScaleDenominator>';
		sld += '          <ogc:Filter>';
		
		//Lowest Possible Value
		if(rules[i].min == null){
			sld += '            <ogc:PropertyIsLessThan>';
			sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
			sld += '              <ogc:Literal>' + rules[i].max + '</ogc:Literal>';
			sld += '            </ogc:PropertyIsLessThan>';
		}
		
		//All Middle Values
		if(i > 0 && i < rules.length-1){
			console.log("middle rule")
			sld += '            <ogc:And>';
			
			if(rules[i].equal_to == "min"){
				sld += '              <ogc:PropertyIsGreaterThan>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsGreaterThan>';
				
				sld += '              <ogc:PropertyIsLessThanOrEqualTo>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].max+ '</ogc:Literal>';
				sld += '              </ogc:PropertyIsLessThanOrEqualTo>';
			} else {
				sld += '              <ogc:PropertyIsGreaterThanOrEqualTo>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsGreaterThanOrEqualTo>';
				
				sld += '              <ogc:PropertyIsLessThan>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].max + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsLessThan>';
			}
			sld += '            </ogc:And>';
		}
		
		//Last Rule
		if(i == rules.length-1){
			console.log("last rule")
			sld += '            <ogc:PropertyIsGreaterThan>';
			sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
			sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
			sld += '            </ogc:PropertyIsGreaterThan>';
		}
		
		//End Rule
		sld += '          </ogc:Filter>';
		
		//Styling
		sld += '          <PolygonSymbolizer>';
		sld += '            <Fill>';
		sld += '              <CssParameter name="fill">' + rules[i].fill + '</CssParameter>';
		sld += '            </Fill>';
		sld += '          </PolygonSymbolizer>';
		
		
		sld += '</Rule>';
		
		$(ul).append(li);
	}
	
	
	
	$(legend).append(ul);
	
	
	
	//Far Up Values Here
	for(var i = 0; i < rules.length; i++){
		
		
		
		sld += '<Rule>';
		//sld += '          <Name>' + rules[i].label + '</Name>';
		//sld += '          <Title>' + rules[i].label + '</Title>';
		
		//Start Rule
		sld += ' 		  <MinScaleDenominator>200000</MinScaleDenominator>';
		sld += '          <ogc:Filter>';
		
		//Lowest Possible Value
		if(rules[i].min == null){
			sld += '            <ogc:PropertyIsLessThan>';
			sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
			sld += '              <ogc:Literal>' + rules[i].max + '</ogc:Literal>';
			sld += '            </ogc:PropertyIsLessThan>';
		}
		
		//All Middle Values
		if(i > 0 && i < rules.length-1){
			console.log("middle rule")
			sld += '            <ogc:And>';
			
			if(rules[i].equal_to == "min"){
				sld += '              <ogc:PropertyIsGreaterThan>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsGreaterThan>';
				
				sld += '              <ogc:PropertyIsLessThanOrEqualTo>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].max+ '</ogc:Literal>';
				sld += '              </ogc:PropertyIsLessThanOrEqualTo>';
			} else {
				sld += '              <ogc:PropertyIsGreaterThanOrEqualTo>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsGreaterThanOrEqualTo>';
				
				sld += '              <ogc:PropertyIsLessThan>';
				sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
				sld += '              <ogc:Literal>' + rules[i].max + '</ogc:Literal>';
				sld += '              </ogc:PropertyIsLessThan>';
			}
			sld += '            </ogc:And>';
		}
		
		//Last Rule
		if(i == rules.length-1){
			console.log("last rule")
			sld += '            <ogc:PropertyIsGreaterThan>';
			sld += '              <ogc:PropertyName>' + property + '</ogc:PropertyName>';
			sld += '              <ogc:Literal>' + rules[i].min + '</ogc:Literal>';
			sld += '            </ogc:PropertyIsGreaterThan>';
		}
		
		//End Rule
		sld += '          </ogc:Filter>';
		
		//Styling
		sld += '          <PolygonSymbolizer>';
		sld += '            <Fill>';
		sld += '              <CssParameter name="fill">' + rules[i].fill + '</CssParameter>';
		sld += '            </Fill>';
		sld += '            <Stroke>';
		sld += '            	<CssParameter name="stroke">' + rules[i].fill + '</CssParameter>';
		sld += '            	<CssParameter name="stroke-width">1</CssParameter>';
		sld += '            </Stroke>';
		sld += '          </PolygonSymbolizer>';
		
		
		sld += '</Rule>';
		
		
		 
	}
	
	
	
	$(legend).append(ul);
	
	
	
	
	
	sld += '      </FeatureTypeStyle>';
	sld += '    </UserStyle>';
	sld += '  </NamedLayer>';
	sld += '</StyledLayerDescriptor>';
	
	//console.log(sld);
	return sld;
	
	
}



function setCatchmentStyle(color, layername){
	
	console.log(color);
	var sld = '<?xml version="1.0" encoding="ISO-8859-1"?>';
	sld += '<StyledLayerDescriptor version="1.0.0"'; 
	sld += '    xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" ';
	sld += '    xmlns="http://www.opengis.net/sld" ';
	sld += '    xmlns:ogc="http://www.opengis.net/ogc" ';
	sld += '    xmlns:xlink="http://www.w3.org/1999/xlink" ';
	sld += '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">';
	sld += '  <NamedLayer>';
	sld += '    <Name>' + layername + '</Name>';
	sld += '    <UserStyle>';
	sld += '      <Title>SLD Cook Book: Attribute-based polygon</Title>';
	sld += '      <FeatureTypeStyle>';
	sld += '        <Rule>';
	sld += '          <MinScaleDenominator>1</MinScaleDenominator>';
	sld += '          <Name>SmallPop</Name>';
	sld += '          <Title>Less Than 200,000</Title>';
	sld += '          <PolygonSymbolizer>';
	sld += '            <Fill>';
	sld += '              <CssParameter name="fill">' + color + '</CssParameter>';
	sld += '            </Fill>';
	sld += '          </PolygonSymbolizer>';
	sld += '        </Rule>';
	sld += '      </FeatureTypeStyle>';
	sld += '    </UserStyle>';
	sld += '  </NamedLayer>';
	sld += '</StyledLayerDescriptor>';

	return sld;
	
}


