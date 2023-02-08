<cfquery datasource="ColdFusionProject" name="qryUsers">
    select * from users
    order by id
</cfquery>
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
                Список пользователей
            </h2>
            <div class="errorContainer"> 
                <div class="errorsList">
                    <cfloop from="1" to='#qryUsers.RecordCount#' index="i" step="1">
                        <div class='errorItem'>
                            <div class='errorItemTop'>
                                <div>
                                    <p>Имя пользователя: <cfoutput>#qryUsers.username[i]#</cfoutput></p>
                                </div>
                            </div>
                            <div class='errorItemBottom'>
                                <div>
                                <p>Имя: <cfoutput>#qryUsers.name[i]#</cfoutput></p>
                                </div>
                                <div>
                                <p>Фамилия: <cfoutput>#qryUsers.secondName[i]#</cfoutput></p>
                                </div>
                            </div>
                        </div>
                    </cfloop>
                </div>
            </div>
        </div>
    </body>
</html>