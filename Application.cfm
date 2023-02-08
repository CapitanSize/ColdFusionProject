<cfapplication name="ColdFusionProjectApp" clientstorage="cookie" clientmanagement="Yes" setclientcookies="Yes" >
<cflocation url="/ColdFusionProject/AuthorisationPage.cfm"  addtoken="false">
<cfif isDefined('Cookie.CFID') AND isDefined('Cookie.CFTOKEN')>
<cflocation url="/ColdFsuionProject/MainPage.cfm"  addtoken="false">
<cfelse>
<cflocation url="/ColdFsuionProject/AuthorisationPage.cfm"  addtoken="false">
</cfif>
<cflogin> 
    <cfif NOT IsDefined("cookie.CFID")> 
        <cfinclude template="/ColdFusionProject/Authorisation.cfm">
    </cfif>
</cflogin>
</cfapplication>