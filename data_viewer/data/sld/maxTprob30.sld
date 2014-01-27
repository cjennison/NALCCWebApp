<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd">
   <NamedLayer>
      <Name>Streams:CatchmentSustTemp</Name>
      <UserStyle>
         <Title>SLD Cook Book: Attribute-based polygon</Title>
         <FeatureTypeStyle>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>Less Than 0</Name>
               <Title>Less Than 0</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 0</Name>
               <Title>greater than 0</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 2</Name>
               <Title>greater than 2</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 3</Name>
               <Title>greater than 3</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 4</Name>
               <Title>greater than 4</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 5</Name>
               <Title>greater than 5</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 6</Name>
               <Title>greater than 6</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#528522</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 7</Name>
               <Title>greater than 7</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
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
			   <MaxScaleDenominator>200000</MaxScaleDenominator>
               <Name>greater than 8</Name>
               <Title>greater than 8</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>maxTp30</ogc:PropertyName>
                     <ogc:Literal>8</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#316B1E</CssParameter>
                  </Fill>
               </PolygonSymbolizer>
            </Rule>
            
            
            
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>Less Than 0</Name>
               <Title>Less Than 0</Title>
               <ogc:Filter>
                  <ogc:PropertyIsLessThan>
                     <ogc:PropertyName>maxTp30</ogc:PropertyName>
                     <ogc:Literal>0</ogc:Literal>
                  </ogc:PropertyIsLessThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#ADADAD</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#ADADAD</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 0</Name>
               <Title>greater than 0</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>0</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>1</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#EFFF45</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#EFFF45</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 1</Name>
               <Title>greater than 1</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>1</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#C4FF45</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#C4FF45</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 2</Name>
               <Title>greater than 2</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>2</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>3</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#9FFF45</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#9FFF45</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 3</Name>
               <Title>greater than 3</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>3</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#85D63A</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#85D63A</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 4</Name>
               <Title>greater than 4</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>4</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>5</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#77BD35</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#77BD35</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 5</Name>
               <Title>greater than 5</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>5</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#64A12B</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#64A12B</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 6</Name>
               <Title>greater than 6</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>6</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#528522</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#528522</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 7</Name>
               <Title>greater than 7</Title>
               <ogc:Filter>
                  <ogc:And>
                     <ogc:PropertyIsGreaterThanOrEqualTo>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>7</ogc:Literal>
                     </ogc:PropertyIsGreaterThanOrEqualTo>
                     <ogc:PropertyIsLessThan>
                        <ogc:PropertyName>maxTp30</ogc:PropertyName>
                        <ogc:Literal>8</ogc:Literal>
                     </ogc:PropertyIsLessThan>
                  </ogc:And>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#428C29</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#428C29</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            <Rule>
			   <MinScaleDenominator>200000</MinScaleDenominator>
               <Name>greater than 8</Name>
               <Title>greater than 8</Title>
               <ogc:Filter>
                  <ogc:PropertyIsGreaterThan>
                     <ogc:PropertyName>maxTp30</ogc:PropertyName>
                     <ogc:Literal>8</ogc:Literal>
                  </ogc:PropertyIsGreaterThan>
               </ogc:Filter>
               <PolygonSymbolizer>
                  <Fill>
                     <CssParameter name="fill">#316B1E</CssParameter>
                  </Fill>
                  <Stroke>
		          	<CssParameter name="stroke">#316B1E</CssParameter>
		          	<CssParameter name="stroke-width">2</CssParameter>
		         </Stroke>
               </PolygonSymbolizer>
            </Rule>
            
         </FeatureTypeStyle>
      </UserStyle>
   </NamedLayer>
</StyledLayerDescriptor>
