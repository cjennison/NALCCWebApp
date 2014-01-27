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
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#10C200</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#40BE23</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#71BB46</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B769</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D2B48C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>12</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#CE9070</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>12</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>14</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#CB6D55</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>14</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>16</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C84A3A</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>16</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>18</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C5271F</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                     <ogc:Literal>18</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C20404</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            
            
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
              <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#10C200</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#10C200</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#40BE23</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#40BE23</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#71BB46</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#71BB46</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B769</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#A1B769</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D2B48C</CssParameter>
                  </Fill>
                   <Stroke>
           			<CssParameter name="stroke">#D2B48C</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>12</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#CE9070</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#CE9070</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>12</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>14</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#CB6D55</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#CB6D55</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>14</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>16</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C84A3A</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#C84A3A</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>16</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                        <ogc:Literal>18</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C5271F</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#C5271F</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>AtmDepNO3</ogc:PropertyName>
                     <ogc:Literal>18</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C20404</CssParameter>
                  </Fill>
                  <Stroke>
           			<CssParameter name="stroke">#C20404</CssParameter>
         		 	<CssParameter name="stroke-width">1</CssParameter>
         		  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>