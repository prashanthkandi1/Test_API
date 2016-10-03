<xsl:stylesheet version="1.0" 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
     xmlns:apim="http://www.ibm.com/apimanagement"
     xmlns:dp="http://www.datapower.com/extensions" 
     extension-element-prefixes="dp"
     exclude-result-prefixes="dp apim"
> 

  <!-- Contains the APIM functions --> 
  <xsl:include href="local:///isp/policy/apim.custom.xsl" /> 
  
  <xsl:template match="/">
    <!-- Retrieves node-set containing all Policy properties --> 
    <xsl:variable name="properties" select="apim:policyProperties()" /> 
    
    <!-- set Schema URL for validate action -->
    <dp:set-variable name="'var://context/api/policy/validate/xsdSchemaURL'" value="string($properties/xmlSchemaURL)"/>
    
    <!-- Initial state: assume no error -->
    <dp:set-variable name="'var://context/api/policy/validate/error'" value="'false'"/>
    
    <!-- Put the payload onto the Output context. -->
    <xsl:copy-of select="apim:payloadRead()" />
  </xsl:template>

</xsl:stylesheet>
