<!--- 
Name: payload.cfc
Author: Matt Gifford aka coldfumonkeh (http://www.mattgifford.co.uk/)
Date: 17.08.2011
Purpose: The github post-receive hook payload object.
--->
<cfcomponent displayname="payload" output="false">

	<cfproperty name="after"		type="string" />
	<cfproperty name="base_ref"		type="string" />
	<cfproperty name="before" 		type="string" />
	<cfproperty name="commits"		type="array" />
	<cfproperty name="compare"		type="string" /> 
	<cfproperty name="created"		type="string" /> 
	<cfproperty name="deleted"		type="string" /> 
	<cfproperty name="forced"		type="string" /> 
	<cfproperty name="pusher"		type="struct" />
	<cfproperty name="ref"			type="string" /> 
	<cfproperty name="repository"	type="repository" />
	<cfproperty name="latestCommit" type="commit" />
	
	<cfset variables.instance = {} />
	
	<cffunction name="init" access="public" output="false" hint="I am the constructor method for the payload component.">
		<cfargument name="payload" required="true" type="Struct" hint="I am the structure containing the payload details." />
			<cfscript>
				variables.instance.after		=	arguments.payload.after;
				variables.instance.base_ref		=	arguments.payload.base_ref;
				variables.instance.before		=	arguments.payload.before;
				setCommits(arguments.payload.commits);
				variables.instance.compare		=	arguments.payload.compare;
				variables.instance.created		=	arguments.payload.created;
				variables.instance.deleted		=	arguments.payload.deleted;
				variables.instance.forced		=	arguments.payload.forced;
				variables.instance.pusher		=	arguments.payload.pusher;
				variables.instance.ref			=	arguments.payload.ref;
				variables.instance.repository	=	createObject('component','repository').init(arguments.payload.repository);
				/* Get the latest commit */
				variables.instance.latestCommit	=	setLatestCommit();
			</cfscript>
		<cfreturn this />
	</cffunction>
	
	<!--- Setters / Mutators --->
	<cffunction name="setCommits" access="private" output="false" hint="I set the commit array values.">
		<cfargument name="commits" required="true" type="array" hint="I am the array containing commit details." />
			<cfset var arrCommits = [] />
			<cfif arrayLen(arguments.commits)>
				<cfloop array="#arguments.commits#" index="commitDetail">
					<cfset arrayAppend(arrCommits,createObject('component','commit').init(commitDetail)) />
				</cfloop>
			</cfif>
		<cfset variables.instance.commits = arrCommits />
	</cffunction>
	
	<cffunction name="setLatestCommit" access="public" output="false" hint="I store the latest commit information.">
		<cfset var arrCommits		=	getCommits() />
		<cfset var latestCommitVal 	= 	arrayLen(arrCommits) />
		<cfreturn arrCommits[latestCommitVal] />
	</cffunction>
	
	<!--- Getters / Accessors --->
	<cffunction name="getAfter" 		access="public" output="false" hint="I return the after value.">
		<cfreturn variables.instance.after />
	</cffunction>
	
	<cffunction name="getBase_Ref" 		access="public" output="false" hint="I return the base_ref value.">
		<cfreturn variables.instance.base_ref />
	</cffunction>
	
	<cffunction name="getBefore" 		access="public" output="false" hint="I return the before value.">
		<cfreturn variables.instance.before />
	</cffunction>
	
	<cffunction name="getCommits" 		access="public" output="false" hint="I return the commits value.">
		<cfreturn variables.instance.commits />
	</cffunction>
	
	<cffunction name="getCompare" 		access="public" output="false" hint="I return the compare value.">
		<cfreturn variables.instance.compare />
	</cffunction>
	
	<cffunction name="getCreated" 		access="public" output="false" hint="I return the created value.">
		<cfreturn variables.instance.created />
	</cffunction>
	
	<cffunction name="getDeleted" 		access="public" output="false" hint="I return the deleted value.">
		<cfreturn variables.instance.deleted />
	</cffunction>
	
	<cffunction name="getForced" 		access="public" output="false" hint="I return the forced value.">
		<cfreturn variables.instance.forced />
	</cffunction>
	
	<cffunction name="getPusher" 		access="public" output="false" hint="I return the pusher value.">
		<cfreturn variables.instance.pusher />
	</cffunction>
	
	<cffunction name="getRef" 			access="public" output="false" hint="I return the ref value.">
		<cfreturn variables.instance.ref />
	</cffunction>
	
	<cffunction name="getLatestCommit" access="public" output="false" hint="I return the latest commit information.">
		<cfreturn variables.instance.latestCommit />
	</cffunction>
	
	<cffunction name="getRepository" 	access="public" output="false" hint="I return the repository value.">
		<cfreturn variables.instance.repository />
	</cffunction>	
	
</cfcomponent>