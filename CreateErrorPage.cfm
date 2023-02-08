<cfquery datasource="ColdFusionProject" name="qryStatus">
    select * from status
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryUrgency">
    select * from urgency
</cfquery>
<cfquery datasource="ColdFusionProject" name="qryCriticality">
    select * from criticality
</cfquery>
<html>
    <head>
        <title>
        Create Error
        </title>
        <link rel="stylesheet" href="/ColdFusionProject/styles.css">
    </head>
    <body>
        <cfinclude template = "/ColdFusionProject/Header.cfm">
        <div class="main">
            <h2>
                Ввод новой ошибки
            </h2>
            <div class="createErrorContainer"> 
                <form action="/ColdFusionProject/CreateErrorLogic.cfm" method="post" class="formWrapper">
                <div class="createErrorForm">
                <div class="rightSide">
                    <div class="item">
                        <label for="shortDesc"><b>Короткое описание</b></label>
                        <input type="text" placeholder="Ввод..." name="shortDesc" required>
                    </div>
                    <br>
                    <div class="item">
                        <label for="longDesc"><b>Подробное описание</b></label>
                        <textarea type="text" placeholder="Ввод..." name ="longDesc" required></textarea>
                    </div>
                </div>
                <div class = "leftSide">
                    <div class="item">
                        <label for="status"><b>Выберите статус:</b></label>
                        <select id="status" name ="status" required>
                            <option value = 1 ><cfoutput>#qryStatus.name[1]#</cfoutput></option>
                            <option value = 2 ><cfoutput>#qryStatus.name[2]#</cfoutput></option>
                            <option value = 3 ><cfoutput>#qryStatus.name[3]#</cfoutput></option>
                            <option value = 4 ><cfoutput>#qryStatus.name[4]#</cfoutput></option>
                        </select>
                    </div>
                    <br>
                    <div class="item">
                        <label for="urgency"><b>Выберите срочность:</b></label>
                        <select id="urgency" name ="urgency" required>
                            <option value = 1 ><cfoutput>#qryUrgency.name[1]#</cfoutput></option>
                            <option value = 2 ><cfoutput>#qryUrgency.name[2]#</cfoutput></option>
                            <option value = 3 ><cfoutput>#qryUrgency.name[3]#</cfoutput></option>
                            <option value = 4 ><cfoutput>#qryUrgency.name[4]#</cfoutput></option>
                        </select>
                    </div>
                    <br>
                    <div class="item">
                        <label for="criticality"><b>Выберите критичность:</b></label>
                        <select id="criticality" name ="criticality" required>
                            <option value = 1 ><cfoutput>#qryCriticality.name[1]#</cfoutput></option>
                            <option value = 2 ><cfoutput>#qryCriticality.name[2]#</cfoutput></option>
                            <option value = 3 ><cfoutput>#qryCriticality.name[3]#</cfoutput></option>
                            <option value = 4 ><cfoutput>#qryCriticality.name[4]#</cfoutput></option>
                        </select>
                    </div>
                </div>
                </div>
                    <br>
                    <div class="item">
                        <button type="submit">Создать ошибку</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>