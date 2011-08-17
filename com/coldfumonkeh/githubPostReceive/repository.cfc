<!--- 
Name: repository.cfc
Author: Matt Gifford aka coldfumonkeh (http://www.mattgifford.co.uk/)
Date: 17.08.2011
Purpose: The github post-receive hook repository object.
--->
<cfcomponent displayname="repository" output="false">

	<cfproperty name="created_at"		type="string" />
	<cfproperty name="description"		type="string" /> 
	<cfproperty name="fork"				type="string" /> 
	<cfproperty name="forks"			type="string" /> 
	<cfproperty name="has_downloads"	type="string" />
	<cfproperty name="has_issues"		type="string" />
	<cfproperty name="has_wiki"			type="string" />
	<cfproperty name="homepage"			type="string" />
	<cfproperty name="name" 			type="string" />
	<cfproperty name="open_issues"		type="string" />
	<cfproperty name="owner"			type="struct" /> 
	<cfproperty name="private"			type="string" />
	<cfproperty name="pushed_at"		type="string" />
	<cfproperty name="size"				type="string" />
	<cfproperty name="url"				type="string" />
	<cfproperty name="watchers"			type="string" /> 

	
	<cfset variables.instance = {} />
	
	<cffunction name="init" access="public" output="false" hint="I am the constructor method for the repository component">
		<cfargument name="repository" required="true" type="Struct" hint="I am the structure containing the repository details." />
			<cfscript>
				variables.instance.created_at 		= arguments.repository.created_at;
				variables.instance.description 		= arguments.repository.description;
				variables.instance.fork 			= arguments.repository.fork;
				variables.instance.forks 			= arguments.repository.forks;
				variables.instance.has_downloads 	= arguments.repository.has_downloads;
				variables.instance.has_issues 		= arguments.repository.has_issues;
				variables.instance.has_wiki 		= arguments.repository.has_wiki;
				variables.instance.homepage 		= arguments.repository.homepage;
				variables.instance.name 			= arguments.repository.name;
				variables.instance.open_issues 		= arguments.repository.open_issues;
				variables.instance.owner 			= arguments.repository.owner;
				variables.instance.private 			= arguments.repository.private;
				variables.instance.pushed_at 		= arguments.repository.pushed_at;
				variables.instance.size 			= arguments.repository.size;
				variables.instance.url 				= arguments.repository.url;
				variables.instance.watchers 		= arguments.repository.watchers;
			</cfscript>
		<cfreturn this />
	</cffunction>	
	
	<!--- Getters / Accessors --->
	
	<cffunction name="getCreated_At" access="public" output="false" hint="I return the created_at value.">
		<cfreturn variables.instance.created_at />
	</cffunction>
	
	<cffunction name="getDescription" access="public" output="false" hint="I return the pledgie value.">
		<cfreturn variables.instance.description />
	</cffunction>	
	
	<cffunction name="getFork" access="public" output="false" hint="I return the fork value.">
		<cfreturn variables.instance.fork />
	</cffunction>
	
	<cffunction name="getForks" access="public" output="false" hint="I return the forks value.">
		<cfreturn variables.instance.forks />
	</cffunction>
	
	<cffunction name="getHas_Downloads" access="public" output="false" hint="I return the has_downloads value.">
		<cfreturn variables.instance.has_downloads />
	</cffunction>
	
	<cffunction name="getHas_Issues" access="public" output="false" hint="I return the has_issues value.">
		<cfreturn variables.instance.has_issues />
	</cffunction>
	
	<cffunction name="getHas_Wiki" access="public" output="false" hint="I return the has_wiki value.">
		<cfreturn variables.instance.has_wiki />
	</cffunction>
	
	<cffunction name="getHomepage" access="public" output="false" hint="I return the homepage value.">
		<cfreturn variables.instance.homepage />
	</cffunction>
	
	<cffunction name="getName" access="public" output="false" hint="I return the name value.">
		<cfreturn variables.instance.name />
	</cffunction>

	<cffunction name="getOpen_Issues" access="public" output="false" hint="I return the open_issues value.">
		<cfreturn variables.instance.open_issues />
	</cffunction>
	
	<cffunction name="getOwner" access="public" output="false" hint="I return the owner value.">
		<cfreturn variables.instance.owner />
	</cffunction>
	
	<cffunction name="getPrivate" access="public" output="false" hint="I return the private value.">
		<cfreturn variables.instance.private />
	</cffunction>
	
	<cffunction name="getPushed_At" access="public" output="false" hint="I return the name pushed_at.">
		<cfreturn variables.instance.pushed_at />
	</cffunction>
	
	<cffunction name="getSize" access="public" output="false" hint="I return the size value.">
		<cfreturn variables.instance.size />
	</cffunction>
	
	<cffunction name="getURL" access="public" output="false" hint="I return the url value.">
		<cfreturn variables.instance.url />
	</cffunction>
	
	<cffunction name="getWatchers" access="public" output="false" hint="I return the watchers value.">
		<cfreturn variables.instance.watchers />
	</cffunction>

</cfcomponent>