<cfquery datasource="ColdFusionProject" name="qryStatus">
    select * from status
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUrgency">
    select * from urgency
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryCriticality">
    select * from criticality
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryErrorCurrent">
    select * from errors
    where id = #cookie.currnetError#
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryActions">
    select * from actions
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryErrorHistory" result="errorHistoryResult">
    select * from errorsHistory
    where errorid = #cookie.currnetError#
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUsers">
    select * from users
</cfquery>

<html>
    <head>
        <title>
        Редактирование ошибки
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <cfinclude template = "/ColdFusionProject/Header.cfm">
        <div class="main">
            <h2>
                Редактирование ошибки
            </h2>
            <div class="editErrorContainer">
                <div class="editErrorRight">
                    <div class="editErrorWrapperRight">
                    <form class="editErrorForm" action="/ColdFusionProject/ErrorItemLogic.cfm" method="post">
                        <div class='errorItemTop'>
                            <div class="shortDescriptionErrorEdit">
                                <p><cfoutput>#qryErrorCurrent.shortdescription#</cfoutput></p>
                            </div>
                            <div class='longDescriptionErrorEdit'>
                            <p>Описание: <cfoutput> #qryErrorCurrent.longdescription#</cfoutput></p>
                            </div>
                        </div>
                    <div class='errorItemBottom'>
                            <div class="editErrorItem">
                            <label for="status"><b>Старый статус: <cfoutput>#qryStatus.name[qryErrorCurrent.statusid]#</cfoutput></b></label>
                            </div>
                            <div class="editErrorItem">
                            <label for="status"><b>Выберите новый статус:</b></label>
                            <select id="status" name ="status" required>
                                <option value = 1 ><cfoutput>#qryStatus.name[1]#</cfoutput></option>
                                <option value = 2 ><cfoutput>#qryStatus.name[2]#</cfoutput></option>
                                <option value = 3 ><cfoutput>#qryStatus.name[3]#</cfoutput></option>
                                <option value = 4 ><cfoutput>#qryStatus.name[4]#</cfoutput></option>
                            </select>
                            </div>
                    <div class="editErrorItem">
                        <label for="status"><b>Срочность: <cfoutput>#qryUrgency.name[qryErrorCurrent.urgencyid]#</cfoutput></b></label>
                    </div>
                    <div class="editErrorItem">
                        <label for="status"><b>Критичность: <cfoutput>#qryCriticality.name[qryErrorCurrent.criticalityid]#</cfoutput></b></label>
                    </div>
                    <div class="editErrorItem">
                            <label for="action"><b>Выберите действие:</b></label>
                            <select id="action" name ="action" required>
                                <option value = 1 ><cfoutput>#qryActions.name[1]#</cfoutput></option>
                                <option value = 2 ><cfoutput>#qryActions.name[2]#</cfoutput></option>
                                <option value = 3 ><cfoutput>#qryActions.name[3]#</cfoutput></option>
                                <option value = 4 ><cfoutput>#qryActions.name[4]#</cfoutput></option>
                            </select>
                            </div>
                    <div class="editErrorItem">
                        <label for="comment"><b>Комментарий</b></label>
                        <textarea type="text" placeholder="Ввод..." name ="comment" required></textarea>
                    </div>
                    <div>
                        <button type="submit">Сохранить изменения</button>
                    </div>
                </div>
                </form>
                </div>
            </div>
                    <div class="editErrorLeft">
                        <div class="editErrorWrapperLeft"> 
                            <div class="editErrorItem">
                            <h4>История ошибки:</h2>
                            </div>
                            <div class="errorsHistoryList">
                                <cfloop from="1" to='#errorHistoryResult.RecordCount#' index="i" step="1">
                                    <div class="errorHistoryItem">
                                        <div class="errorEditItem">
                                        <p>Дата изменения: <cfoutput>#dateFormat(qryErrorHistory.date[i], 'dd mmmm yyyy')#</cfoutput></p>
                                        </div>
                                        <div class="errorEditItem">
                                        <p>Комментарий: <cfoutput>#qryErrorHistory.comment[i]#</cfoutput></p>
                                        </div>
                                        <div class="errorEditItem">
                                        <p>Действие: <cfoutput>#qryActions.name[qryErrorHistory.actionid[i]]#</cfoutput></p>
                                        </div>
                                        <div class="errorEditItem">
                                        <p>Имя пользователя: <cfoutput>#qryUsers.username[qryErrorHistory.userid[i]]#</cfoutput></p>
                                        </div>
                                    </div>
                                </cfloop>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </body>
</html>