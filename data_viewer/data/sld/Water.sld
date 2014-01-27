<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:NENY_NHDCatchments_LocalStats_2</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>0%</Name>
               <Title>0%</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>Water</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#426E1E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>1% - 10%</Name>
               <Title>1% - 10%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#3B6D2C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>11% - 20%</Name>
               <Title>11% - 20%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#346C3A</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>21% - 30%</Name>
               <Title>21% - 30%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2E6B48</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>31% - 40%</Name>
               <Title>31% - 40%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#276A56</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>41% - 50%</Name>
               <Title>41% - 50%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#216A64</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>51% - 60%</Name>
               <Title>51% - 60%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#1A6972</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>61% - 70%</Name>
               <Title>61% - 70%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#136880</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>71% - 80%</Name>
               <Title>71% - 80%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0D678E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>81% - 90%</Name>
               <Title>81% - 90%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>90</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#06669C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>91% - 100%</Name>
               <Title>91% - 100%</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>Water</ogc:PropertyName>
                     <ogc:Literal>91</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0066AA</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            
            
            
            
            
            
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>0%</Name>
               <Title>0%</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>Water</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#426E1E</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#426E1E</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>1% - 10%</Name>
               <Title>1% - 10%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#3B6D2C</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#3B6D2C</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>11% - 20%</Name>
               <Title>11% - 20%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>10</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#346C3A</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#346C3A</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>21% - 30%</Name>
               <Title>21% - 30%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>20</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#2E6B48</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#2E6B48</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>31% - 40%</Name>
               <Title>31% - 40%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>30</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#276A56</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#276A56</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>41% - 50%</Name>
               <Title>41% - 50%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>40</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#216A64</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#216A64</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>51% - 60%</Name>
               <Title>51% - 60%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>50</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#1A6972</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#1A6972</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>61% - 70%</Name>
               <Title>61% - 70%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>60</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#136880</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#136880</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>71% - 80%</Name>
               <Title>71% - 80%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>70</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0D678E</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#0D678E</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>81% - 90%</Name>
               <Title>81% - 90%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>80</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>Water</ogc:PropertyName>
                        <ogc:Literal>90</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#06669C</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#06669C</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>91% - 100%</Name>
               <Title>91% - 100%</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>Water</ogc:PropertyName>
                     <ogc:Literal>91</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#0066AA</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#0066AA</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>