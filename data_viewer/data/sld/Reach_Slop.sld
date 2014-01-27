<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:NENY_NHDCatchments_LocalStats_2</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>~ 0 or no data</Name>
               <Title>~ 0 or no data</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFF4D4</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0 - 0.05</Name>
               <Title>0 - 0.05</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.05</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ECE1C4</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.05 - 0.10</Name>
               <Title>0.05 - 0.10</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.05</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D9CFB4</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.10 - 0.15</Name>
               <Title>0.10 - 0.15</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.15</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C6BCA5</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.15 - 0.20</Name>
               <Title>0.15 - 0.20</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.15</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B3AA95</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.20 - 0.25</Name>
               <Title>0.20 - 0.25</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.25</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A09786</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.25 - 0.30</Name>
               <Title>0.25 - 0.30</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.25</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8E8576</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.30 - 0.35</Name>
               <Title>0.30 - 0.35</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.35</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#7B7267</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.35 - 0.40</Name>
               <Title>0.35 - 0.40</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.35</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#686057</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.40 - 0.45</Name>
               <Title>0.40 - 0.45</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.45</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#554D48</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0.45 - 0.50</Name>
               <Title>0.45 - 0.50</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.45</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#423B38</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>Greater than 0.50</Name>
               <Title>Greater than 0.50</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                     <ogc:Literal>0.5</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#302929</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            
            
            
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>~ 0 or no data</Name>
               <Title>~ 0 or no data</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFF4D4</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#FFF4D4</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0 - 0.05</Name>
               <Title>0 - 0.05</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.05</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ECE1C4</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#ECE1C4</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.05 - 0.10</Name>
               <Title>0.05 - 0.10</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.05</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D9CFB4</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#D9CFB4</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.10 - 0.15</Name>
               <Title>0.10 - 0.15</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.15</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C6BCA5</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#C6BCA5</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.15 - 0.20</Name>
               <Title>0.15 - 0.20</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.15</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B3AA95</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#B3AA95</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.20 - 0.25</Name>
               <Title>0.20 - 0.25</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.25</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A09786</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#A09786</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.25 - 0.30</Name>
               <Title>0.25 - 0.30</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.25</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#8E8576</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#8E8576</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.30 - 0.35</Name>
               <Title>0.30 - 0.35</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.35</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#7B7267</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#7B7267</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.35 - 0.40</Name>
               <Title>0.35 - 0.40</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.35</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#686057</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#686057</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.40 - 0.45</Name>
               <Title>0.40 - 0.45</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.45</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#554D48</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#554D48</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0.45 - 0.50</Name>
               <Title>0.45 - 0.50</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.45</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#423B38</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#423B38</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>Greater than 0.50</Name>
               <Title>Greater than 0.50</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>RchSlpDEG</ogc:PropertyName>
                     <ogc:Literal>0.5</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#302929</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#302929</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            
            
            
            
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>