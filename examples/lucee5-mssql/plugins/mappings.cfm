<!--- Do Not Edit --->
<cfif not isDefined('this.name')>
<cfoutput>Access Restricted.</cfoutput>
<cfabort>
</cfif>
<cfset pluginDir=getDirectoryFromPath(getCurrentTemplatePath())/>
<cfset this.mappings["/plugins"] = pluginDir>
