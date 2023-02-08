<cfquery datasource="ColdFusionProject" name="qryCurrentUser">
    select * from users
    where username = '#cookie.username#'
</cfquery>
<cfif form.username neq ''>
    <cfquery datasource="ColdFusionProject">
        update users set username = '#form.username#' where id = #qryCurrentUser.id#
    </cfquery>
    <cfcookie name="username"  value="#form.username#" expires="never">
</cfif>
<cfif form.name neq ''>
    <cfquery datasource="ColdFusionProject">
        update users set name = '#form.name#' where id = #qryCurrentUser.id#
    </cfquery>
</cfif>
<cfif form.secondName neq ''>
    <cfquery datasource="ColdFusionProject">
        update users set secondname = '#form.secondName#' where id = #qryCurrentUser.id#
    </cfquery>
</cfif>
<cflocation url="/ColdFusionProject/MainPage.cfm" addtoken="false">