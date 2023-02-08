<cfquery datasource="ColdFusionProject" name="qryErrors">
    select * from errors
    order by id
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryStatus">
    select * from status
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUrgency">
    select * from urgency
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryCriticality">
    select * from criticality
</cfquery>
<cfset countOfErrors = qryErrors.RecordCount>
<html>
    <head>
        <title>
        Ошибки
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <cfinclude template = "/ColdFusionProject/Header.cfm">
        <div class="main">
            <h2>
                Ошибки
            </h2>
            <div class="errorContainer">
            <cfif countOfErrors neq 0> 
                <div class="errorsList">
                    <cfloop from="1" to='#countOfErrors#' index="i" step="1">
                    <cfform action="/ColdFusionProject/MainPageLogic.cfm" method="post">
                        <div class='errorItem'>
                            <div class='errorItemTop'>
                                <div>
                                    <p><cfoutput>#qryErrors.shortdescription[i]#</cfoutput></p>
                                </div>
                                <div class='longDescription'>
                                <p>Описание: <cfoutput>  #qryErrors.longdescription[i]#</cfoutput></p>
                                </div>
                            </div>
                            <div class='errorItemBottom'>
                                <div>
                                <p>Статус: <cfoutput>#qryStatus.name[qryErrors.statusid[i]]#</cfoutput></p>
                                </div>
                                <div>
                                <p>Срочность: <cfoutput>#qryUrgency.name[qryErrors.urgencyid[i]]#</cfoutput></p>
                                </div>
                                <div>
                                <p>Критичность: <cfoutput>#qryCriticality.name[qryErrors.criticalityid[i]]#</cfoutput></p>
                                </div>
                                <div>
                                    Редактировать ошибку -  <cfinput type="submit" class="button" name="currnetError" value="#qryErrors.id[i]#">
                                </div>
                            </div>
                        </div>
                    </cfform>
                    </cfloop>
                </div>
                <cfelse>
                <div class="emptyText">
                    <h2>Ошибок пока нет</h2>
                </div>
            </cfif>
            </div>
        </div>
    </body>
</html>