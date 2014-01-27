<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:NENY_NHDCatchments_UpstreamStats</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
         
         
         
         
         
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>~ 0km or no data</Name>
               <Title>~ 0km or no data</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#001111</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>1km - 10km</Name>
               <Title>1km - 10km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer> 
                  <Fill>
                     <CssParameter name="fill">#002028</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
            	<MaxScaleDenominator>200000</MaxScaleDenominator>
            
               <Name>11km - 50km</Name>
               <Title>11km - 50km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#002F40</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>51km - 100km</Name>
               <Title>51km - 100km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>100</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#003E58</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>101km - 500km</Name>
               <Title>101km - 500km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>100</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>500</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#004E70</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>501km - 200000km</Name>
               <Title>501km - 200000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>500</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>1000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#005D88</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>1001km - 2000km</Name>
               <Title>1001km - 2000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>1000</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>2000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#006C9F</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>2001km - 5000km</Name>
               <Title>2001km - 5000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>2000</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>5000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#007CB7</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>5001km or greater</Name>
               <Title>5001km or greater</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                     <ogc:Literal>5000</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#008BCF</CssParameter>
                  </Fill>
                  
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>~ 0km or no data</Name>
               <Title>~ 0km or no data</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#001111</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#001111</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>1km - 10km</Name>
               <Title>1km - 10km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#002028</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#002028</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>11km - 50km</Name>
               <Title>11km - 50km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#002F40</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#002F40</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>51km - 100km</Name>
               <Title>51km - 100km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>100</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#003E58</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#003E58</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>101km - 500km</Name>
               <Title>101km - 500km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>100</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>500</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#004E70</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#004E70</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>501km - 200000km</Name>
               <Title>501km - 200000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>500</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>1000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#005D88</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#005D88</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>1001km - 2000km</Name>
               <Title>1001km - 2000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>1000</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>2000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#006C9F</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#006C9F</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>2001km - 5000km</Name>
               <Title>2001km - 5000km</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>2000</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                        <ogc:Literal>5000</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#007CB7</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#007CB7</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <Name>5001km or greater</Name>
               <Title>5001km or greater</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>TotDASqKM</ogc:PropertyName>
                     <ogc:Literal>5000</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#008BCF</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#008BCF</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>