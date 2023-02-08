<cfquery datasource="ColdFusionProject" name="qryStatus">
    select * from status
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUrgency">
    select * from urgency
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryCriticality">
    select * from criticality
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryErrors">
    select * from errors
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryErrorsHistory">
    select * from errorshistory
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUsers">
    select * from users
    where username = '#cookie.username#'
</cfquery>
<cfset countErros = qryErrors.RecordCount>
<cfset countErrosHistory = qryErrorsHistory.RecordCount>

<cfquery datasource="ColdFusionProject">
    update errors set statusid = #form.status# where id = #cookie.currnetError#
</cfquery>
<cfquery datasource="ColdFusionProject">
    insert into errorshistory (id, date, actionid, comment, errorid, userid)
    values (#countErrosHistory + 1#, '#dateFormat(now(), 'yyyy-dd-mm')#', #form.action#, '#form.comment#', #cookie.currnetError#, #qryUsers.id#)
</cfquery>
<cflocation url="/ColdFusionProject/MainPage.cfm" addtoken="false">