<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:temp_occ_resil</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
               <Name>Less Than 0</Name>
               <Title>Less Than 0</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ADADAD</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 0</Name>
               <Title>greater than 0</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#EFFF45</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C4FF45</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#9FFF45</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#85D63A</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#77BD35</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#64A12B</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>598C29 than 1</Name>
               <Title>598C29 than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#77BD35</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#428C29</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>MaxTempPro</ogc:PropertyName>
                     <ogc:Literal>8</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#316B1E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>