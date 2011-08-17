<!--- 
Name: commit.cfc
Author: Matt Gifford aka coldfumonkeh (http://www.mattgifford.co.uk/)
Date: 17.08.2011
Purpose: The github post-receive hook commit object.
--->
<cfcomponent displayname="commit" output="false">

	<cfproperty name="added"		type="array" />
	<cfproperty name="author"		type="struct" /> 
	<cfproperty name="distinct"		type="string" /> 
	<cfproperty name="id"			type="string" /> 
	<cfproperty name="message"		type="string" />
	<cfproperty name="modified"		type="array" />
	<cfproperty name="removed"		type="array" />
	<cfproperty name="timestamp"	type="string" />
	<cfproperty name="url"			type="string" />

	<cfset variables.instance = {} />
	
	<cffunction name="init" access="public" output="false" hint="I am the constructor method for the commit component.">
		<cfargument name="commit" required="true" type="Struct" hint="I am the structure containing the commit details." />
			<cfscript>
				variables.instance.added 		= arguments.commit.added;
				variables.instance.author 		= arguments.commit.author;
				variables.instance.distinct 	= arguments.commit.distinct;
				variables.instance.id 			= arguments.commit.id;
				variables.instance.message 		= arguments.commit.message;
				variables.instance.modified 	= arguments.commit.modified;
				variables.instance.removed 		= arguments.commit.removed;
				variables.instance.timestamp 	= arguments.commit.timestamp;
				variables.instance.url 			= arguments.commit.url;
			</cfscript>
		<cfreturn this />
	</cffunction>	
	
	<!--- Getters / Accessors --->
	<cffunction name="getAdded" 	access="public" output="false" hint="I return the added value.">
		<cfreturn variables.instance.added />
	</cffunction>
	
	<cffunction name="getAuthor" 	access="public" output="false" hint="I return the author value.">
		<cfreturn variables.instance.author />
	</cffunction>	
	
	<cffunction name="getDistinct" 	access="public" output="false" hint="I return the distinct value.">
		<cfreturn variables.instance.distinct />
	</cffunction>
	
	<cffunction name="getID" 		access="public" output="false" hint="I return the id value.">
		<cfreturn variables.instance.id />
	</cffunction>
	
	<cffunction name="getMessage" 	access="public" output="false" hint="I return the message value.">
		<cfreturn variables.instance.message />
	</cffunction>
	
	<cffunction name="getModified" 	access="public" output="false" hint="I return the modified value.">
		<cfreturn variables.instance.modified />
	</cffunction>
	
	<cffunction name="getRemoved" 	access="public" output="false" hint="I return the removed value.">
		<cfreturn variables.instance.removed />
	</cffunction>
	
	<cffunction name="getTimestamp" access="public" output="false" hint="I return the timestamp value.">
		<cfreturn variables.instance.timestamp />
	</cffunction>
	
	<cffunction name="getURL" 		access="public" output="false" hint="I return the url value.">
		<cfreturn variables.instance.url />
	</cffunction>

</cfcomponent>