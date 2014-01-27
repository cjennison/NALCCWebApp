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
                     <ogc:PropertyName>UndevForst</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFEA8C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#E7DC80</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D0CE74</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B9C068</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B25D</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8AA451</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#739645</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5B883A</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#447A2E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>90</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2D6C22</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyName>UndevForst</ogc:PropertyName>
                     <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsGreaterThanOrEqualTo>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#165E17</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>UndevForst</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFEA8C</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#FFEA8C</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#E7DC80</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#E7DC80</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D0CE74</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#D0CE74</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B9C068</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#B9C068</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A1B25D</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#A1B25D</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8AA451</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#8AA451</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#739645</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#739645</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5B883A</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#5B883A</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#447A2E</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#447A2E</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>UndevForst</ogc:PropertyName>
                        <ogc:Literal>90</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2D6C22</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#2D6C22</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
				<MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyName>UndevForst</ogc:PropertyName>
                     <ogc:Literal>90</ogc:Literal>
                  </ogc:PropertyIsGreaterThanOrEqualTo>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#165E17</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#165E17</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>