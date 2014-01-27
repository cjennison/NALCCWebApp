<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:ct_basinchar_occ</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
               <Name>~ 0% or no data</Name>
               <Title>~ 0% or no data</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>plus80</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#9C9C9C</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>1% - 10%</Name>
               <Title>1% - 10%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#9E8560</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>11% - 20%</Name>
               <Title>11% - 20%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#B8A384</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>21% - 30%</Name>
               <Title>21% - 30%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#CFBFA9</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>31% - 40%</Name>
               <Title>31% - 40%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#E6DDD1</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>41% - 50%</Name>
               <Title>41% - 50%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#FFFFFF</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>51% - 60%</Name>
               <Title>51% - 60%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#D0E3C5</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>61% - 70%</Name>
               <Title>61% - 70%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#A2C48F</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>71% - 80%</Name>
               <Title>71% - 80%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#77A85E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>81% - 90%</Name>
               <Title>81% - 90%</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.8</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>plus80</ogc:PropertyName>
                        <ogc:Literal>0.9</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#4D8C32</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>71% - 80%</Name>
               <Title>71% - 80%</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>plus80</ogc:PropertyName>
                     <ogc:Literal>0.91</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#267300</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>