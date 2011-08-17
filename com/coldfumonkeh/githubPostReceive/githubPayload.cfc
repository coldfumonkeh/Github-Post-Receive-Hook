<!--- 
Name: githubPayload.cfc
Author: Matt Gifford aka coldfumonkeh (http://www.mattgifford.co.uk/)
Date: 17.08.2011
Purpose: The github post-receive hook handler.
--->
<cfcomponent displayname="githubPayload" output="false">

	<cffunction name="receive" access="public" output="false" hint="I receive the payload from the Github post-receive hook commit submission.">
		<cfargument name="payloadSubmission" 	required="true" 	type="Struct" 					hint="I am the FORM structure submitted via the payload push." />
		<cfargument name="asObject"				required="false"	type="boolean" default="false" 	hint="If set to true, I will return the payload as a detailed ColdFusion object." /> 
		<cfargument name="parseResults"			required="false"	type="boolean" default="false"	hint="If returning the payload as JSON and set to to true, will deserialize response to return structure." />
			<cfset var stuPayload	=	'' />
			<cfset var objPayload	=	'' />
				<cfif asObject>
					<cfset stuPayload = deserializeJSON(arguments.payloadSubmission.payload) />
					<cfset objPayload = createObject('component','payload').init(stuPayload) />
				<cfelse>
					<cfset objPayload = arguments.payloadSubmission.payload />
					<cfif parseResults>
						<cfset objPayload = deserializeJSON(objPayload) />
					</cfif>
				</cfif>
		<cfreturn objPayload />
	</cffunction>
	
</cfcomponent>