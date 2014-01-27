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
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>150</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#F75757</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>150</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>170</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#F97941</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>170</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>190</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FB9C2B</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>190</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>210</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FDBE15</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>210</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>230</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFE100</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>230</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>250</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#BFDB09</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>250</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>270</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#7FD612</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>270</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>290</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#3FD11B</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>290</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>310</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#00CC25</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>310</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>330</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#00886D</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>330</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>350</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0044B6</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                     <ogc:Literal>350</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0000FF</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>150</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#F75757</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#F75757</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>150</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>170</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#F97941</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#F97941</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>170</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>190</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FB9C2B</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FB9C2B</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>190</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>210</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FDBE15</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FDBE15</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>210</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>230</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFE100</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#FFE100</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>230</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>250</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#BFDB09</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#BFDB09</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>250</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>270</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#7FD612</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#7FD612</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>270</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>290</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#3FD11B</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#3FD11B</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>290</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>310</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#00CC25</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#00CC25</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>310</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>330</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#00886D</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#00886D</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>330</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                        <ogc:Literal>350</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0044B6</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#0044B6</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>WntrPrcpMM</ogc:PropertyName>
                     <ogc:Literal>350</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0000FF</CssParameter>
                  </Fill>
                  <Stroke>
                     <CssParameter name="stroke">#0000FF</CssParameter>
                     <CssParameter name="stroke-width">1</CssParameter>
                  </Stroke>
               </PolygonSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>