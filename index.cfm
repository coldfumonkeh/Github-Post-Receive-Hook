<!--- Example Payload Response --->
<cfset FORM.payload = '{
  "after": "d1ba8626485e26bf87275de1aa3ff2a62a2e096d", 
  "base_ref": null, 
  "before": "3af75e4d216593e5b456e959559daaa5c138f315", 
  "commits": [
    {
      "added": [
        "com\/coldfumonkeh\/githubPostReceive\/commit.cfc", 
        "com\/coldfumonkeh\/githubPostReceive\/githubPayload.cfc", 
        "com\/coldfumonkeh\/githubPostReceive\/payload.cfc", 
        "com\/coldfumonkeh\/githubPostReceive\/repository.cfc"
      ], 
      "author": {
        "email": "me@mattgifford.co.uk", 
        "name": "Matt Gifford aka coldfumonkeh", 
        "username": "coldfumonkeh"
      }, 
      "distinct": true, 
      "id": "d1ba8626485e26bf87275de1aa3ff2a62a2e096d", 
      "message": "Components added to repos", 
      "modified": [], 
      "removed": [], 
      "timestamp": "2011-08-17T05:11:30-07:00", 
      "url": "https:\/\/github.com\/coldfumonkeh\/Github-Post-Receive-Hook\/commit\/d1ba8626485e26bf87275de1aa3ff2a62a2e096d"
    }
  ], 
  "compare": "https:\/\/github.com\/coldfumonkeh\/Github-Post-Receive-Hook\/compare\/3af75e4...d1ba862", 
  "created": false, 
  "deleted": false, 
  "forced": false, 
  "pusher": {
    "name": "none"
  }, 
  "ref": "refs\/heads\/master", 
  "repository": {
    "created_at": "2011\/08\/17 05:01:37 -0700", 
    "description": "This ColdFusion component will read in your Github commit payload information and provide you with a detailed CFC or JSON string to work with to create custom hook information", 
    "fork": false, 
    "forks": 1, 
    "has_downloads": true, 
    "has_issues": true, 
    "has_wiki": true, 
    "homepage": "http:\/\/www.mattgifford.co.uk\/", 
    "name": "Github-Post-Receive-Hook", 
    "open_issues": 0, 
    "owner": {
      "email": "me@mattgifford.co.uk", 
      "name": "coldfumonkeh"
    }, 
    "private": false, 
    "pushed_at": "2011\/08\/17 05:11:53 -0700", 
    "size": 96, 
    "url": "https:\/\/github.com\/coldfumonkeh\/Github-Post-Receive-Hook", 
    "watchers": 1
  }
}' />


<!--- Instantiate the component --->
<cfset objPayload = createObject('component','com.coldfumonkeh.githubPostReceive.githubPayload') />
<!--- Call the receive() method to process the deployed payload information --->
<cfset payloadinfo = objPayload.receive(
							payloadSubmission	=	FORM,
							asObject			=	true,
							parseResults		=	false
						) />

<cfdump var="#payloadinfo#" />

<!--- Example Useage --->

<!--- Twitter Status Update --->

<!--- 
	To send a custom message to Twitter, download monkehTweet (monkehtweet.riaforge.org)
	and send in your custom message to update your Twitter stream.
--->

<!--- Custom Email Content (basic) --->
<cfsavecontent variable="updateMessage">
	<cfoutput>
	Repository update from #payloadinfo.getRepository().getName()#
	Message: "#payloadinfo.getLatestCommit().getMessage()#"
	
	Files added: #arrayLen(payloadinfo.getLatestCommit().getAdded())#
	Files modified: #arrayLen(payloadinfo.getLatestCommit().getModified())#
	Files deleted: #arrayLen(payloadinfo.getLatestCommit().getRemoved())#
	
	View the changes made <a href="#payloadinfo.getLatestCommit().getURL()#">here</a>
	
	</cfoutput>
</cfsavecontent>