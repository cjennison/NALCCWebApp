<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:NENY_NHDCatchments_LocalStats_2</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>900</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF3300</CssParameter>
                  </Fill>
                
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>900</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>970</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF6533</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>970</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1040</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF9733</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1040</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1110</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFC933</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1110</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1180</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFFC33</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1180</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1250</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C8FC26</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1250</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1320</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#92FD19</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1320</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1390</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5CFE0C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1390</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1460</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#45C72D</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1460</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1530</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2F914E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1530</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1600</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#195A6F</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                     <ogc:Literal>1600</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#032491</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
           
           
           <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>900</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF3300</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FF3300</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>900</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>970</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF6533</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FF6533</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>970</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1040</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FF9733</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FF9733</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1040</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1110</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFC933</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FFC933</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1110</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1180</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFFC33</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FFFC33</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1180</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1250</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C8FC26</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#C8FC26</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1250</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1320</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#92FD19</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#92FD19</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1320</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1390</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#5CFE0C</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#5CFE0C</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1390</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1460</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#45C72D</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#45C72D</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1460</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1530</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2F914E</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#2F914E</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1530</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                        <ogc:Literal>1600</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#195A6F</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#195A6F</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>AnnPrcpMM</ogc:PropertyName>
                     <ogc:Literal>1600</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#032491</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#032491</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>
