<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:NENY_NHDCatchments_UpstreamStats</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C2E7B0</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B7D59E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ACC38D</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B17C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#969F6A</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8B8E59</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#807C48</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#756A36</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#6A5825</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.9</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5F4614</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                     <ogc:Literal>0.9</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#543503</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            
            
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C2E7B0</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#C2E7B0</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B7D59E</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#B7D59E</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ACC38D</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#ACC38D</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B17C</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#A1B17C</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#969F6A</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#969F6A</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8B8E59</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#8B8E59</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#807C48</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#807C48</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#756A36</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#756A36</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#6A5825</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#6A5825</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                        <ogc:Literal>0.9</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5F4614</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#5F4614</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>SurfCrseC</ogc:PropertyName>
                     <ogc:Literal>0.9</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#543503</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#543503</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>